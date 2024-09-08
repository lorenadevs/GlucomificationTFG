using MauiApp1.Services;
using Supabase;
using Supabase.Interfaces;
using MauiApp1.Modelos;
using System.ComponentModel;

namespace MauiApp1.Pages;

public partial class PerfilUsuario : ContentPage
{
    static string url = "SUPABASE URL GOES HERE";
    static string key = "SUPABASE KEY GOES HERE";

    static SupabaseOptions options = new SupabaseOptions
    {
        AutoRefreshToken = true,
        AutoConnectRealtime = true,
    };

    static Client supabaseClient = new Supabase.Client(url, key, options);
    DataService dataService = new DataService(supabaseClient);

    string tokenUsuario = "";
    string tipoUsuario = "";
    Usuario usuarioAjeno;

    //Si se llama a esta clase desde el perfil del propio usuario
    public PerfilUsuario()
    {
        InitializeComponent();
        MostrarNombreActual();
        tipoUsuario = "propio";

        imgAvatar.Source = Perfil.imagenAvatar;

        tokenUsuario = Preferences.Get("currentToken", "unknown");

        MostrarLogros(Preferences.Get("currentUser", "unknown"), tokenUsuario);

    }

    //Si se llama a esta clase desde la búsqueda de usuarios
    public PerfilUsuario(Usuario usuario)
    {
        InitializeComponent();
        tipoUsuario = "ajeno";
        tokenUsuario = usuario.token;
        lblUsername.Text = usuario.nombre_usuario;
        dataService.AsociarAvatarAleatorio(imgAvatar);

        frameEditar.IsVisible = false;

        var btnVolver = new ImageButton
        {
            HorizontalOptions = LayoutOptions.Start,
            VerticalOptions = LayoutOptions.Start,
            Margin = new Thickness(0, 30),
            MaximumHeightRequest = 20,
            Source = "backarrow.png"
        };

        btnVolver.Clicked += VolverAtras;
        gridPrincipal.Children.Add(btnVolver);

        usuarioAjeno = usuario;

    }


    public async void ComprobarVisibilidadPerfil(Usuario usuario)
    {
        if (await dataService.ComprobarPerfilPublico(usuario.nombre_usuario))
        {
            MostrarLogros(usuario.correo, usuario.token);
        }
        else
        {
            zonaLogros.IsVisible = false;
            lblRanking.IsVisible = false;
            zonaGrafico.IsVisible = false;
            glucoChart.IsVisible = false;

            lblPerfilPrivado.IsVisible = true;

        }
    }


    public async void MostrarNombreActual()
    {
        Usuario usu = await dataService.ObtenerUsuario(Preferences.Get("currentUser", "unknown"));
        lblUsername.Text = usu.nombre_usuario;
    }


    /**
     * Muestra los logros obtenidos del usuario. Si no tiene, se mostrarán logros vacíos
     */
    public async void MostrarLogros(string correoUsuario, string tokenUsuario)
    {
        dataService.MostrarGrafico(glucoChart, tokenUsuario, lblUltimoValor, imgFlecha, lblNull);

        List<UsuarioLogro> logros = await dataService.ObtenerLogrosUsuario(correoUsuario);

        if (logros == null) //Si este usuario no tiene logros desbloqueados
        {
            for (int i = 0; i <= 10; i++)
            {
                horizontalStackLayoutAchievements.Add(new Image { Source = "question.png", HeightRequest = 50, WidthRequest = 50 });
            }
        }
        else
        {
            List<Logro> infoLogros = new List<Logro>();
            //Por cada logro del usuario específico
            int contLogros = 0;
            foreach (UsuarioLogro logro in logros)
            {
                //Añade la imagen correspondiente del logro, siendo esta "ach" + el id del logro (el cual se almacena en el campo "logro" de la tabla específica que une usuarios con logros)
                horizontalStackLayoutAchievements.Add(new Image { 
                    Source = "ach" + logro.logroID + ".png", 
                    HeightRequest = 50, 
                    WidthRequest = 50 
                });

                contLogros++;

                var correoUserLogeado = Preferences.Get("currentUser", "unknown");

                if (logro.mostrado == false && logro.usuarioMail.Equals(correoUserLogeado))
                {
                    Logro logroInfo = await dataService.ObtenerInfoLogro(logro.logroID);
                    infoLogros.Add(logroInfo);
                    await dataService.EstablecerLogroMostrado(logro.logroID, correoUsuario);

                    if(logros.Count == contLogros) //En el último elemento
                    {
                        await Navigation.PushModalAsync(new ObtencionLogro(infoLogros));
                    }
                }
            }
        }
    }


    public void btnEditarPerfil(object sender, EventArgs e)
    {
        Navigation.PushModalAsync(new PopUpMenu());
    }


        public void VolverAtras(object sender, EventArgs e)
    {
        Navigation.PopModalAsync();
    }

    //Permite que simule ser reactivo
    private void OnIsBusyChanged(object sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == "IsBusy" && dataService.IsBusy)
        {

            dataService.IsBusy = false;
        }
    }

    public async Task<bool> ComprobarSiTieneRegistros()
    {
        var numRegistros = await dataService.ObtenerLecturas24H(tokenUsuario);
        return numRegistros == null ? false: true;
    }

    protected override async void OnAppearing()
    {
        lblRanking.Text = "";
        if (tipoUsuario.Equals("propio")) //Si se accede desde el usuario logeado
        {
            tokenUsuario = Preferences.Get("currentToken", "unknown");
            if (await ComprobarSiTieneRegistros()) //Se comprueba si el usuario tiene registros de glucosa para evitar valores nulos
            {
                dataService.IsBusy = true; //Modelo Skeleton activo
                dataService.ComprobarNuevosLogros();
                horizontalStackLayoutAchievements.Clear();
                MostrarLogros(Preferences.Get("currentUser", "unknown"), tokenUsuario);
                dataService.ObtenerPuestoSemanalUsuarioEspecifico(tokenUsuario, lblRanking);
            }
        }
        else //Si se accede a un perfil de otro usuario de la comunidad
        {
            tokenUsuario = usuarioAjeno.token;
            dataService.IsBusy = true;
            ComprobarVisibilidadPerfil(usuarioAjeno);
            dataService.ObtenerPuestoSemanalUsuarioEspecifico(tokenUsuario, lblRanking);
        }

        lblUltimoValor.Text = "";
        glucoChart.Chart = null;
        horizontalStackLayoutAchievements.Clear();
        imgFlecha.Source = "";
        base.OnAppearing();
        await ShowBusyIndicator();

    }


    private async Task ShowBusyIndicator()
    {
        dataService.IsBusy = true;
    }

}