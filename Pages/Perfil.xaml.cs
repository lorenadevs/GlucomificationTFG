//using Android.Content.Res;
using MauiApp1.Modelos;
using MauiApp1.Services;
using Microcharts.Maui;
using Microcharts;
using Newtonsoft.Json.Linq;
using Supabase;
using System.Collections;
using System.Text.RegularExpressions;
using SkiaSharp;
using System.ComponentModel;

namespace MauiApp1.Pages;

public partial class Perfil : ContentPage
{
    static string usuarioActual = Preferences.Get("currentUser", "unknown");

    string tokenCurrentUser;
    public static string imagenAvatar = "";

    static string url = "SUPABASE URL GOES HERE";
    static string key = "SUPABASE KEY GOES HERE";

    static SupabaseOptions options = new SupabaseOptions
    {
        AutoRefreshToken = true,
        AutoConnectRealtime = true,
    };

    static Client supabaseClient = new Supabase.Client(url, key, options);

    DataService dataService = new DataService(supabaseClient);


    public Perfil()
    {
        InitializeComponent();
        lblWelcomeText.Text = "Bienvenido,";

        ObtenerDatos24H();

        dataService.AsociarAvatarAleatorio(imgAvatar);

        BindingContext = dataService;
        dataService.PropertyChanged += OnIsBusyChanged; //Cuando IsBusy cambie de valor, se llamar� al m�todo OnIsBusyChanged
        dataService.IsBusy = true;

    }


    /**
     * Asigna el n�mero de lecturas y el porcentaje en rango
     */
    public async void ObtenerEstadisticas()
    {
        var numLecturas = await dataService.ObtenerLecturasSemanales(tokenCurrentUser);
        double porcentajeRango = await dataService.ObtenerPorcentajeRango(tokenCurrentUser);
        lblNumLecturas.Text = numLecturas.ToString();
        lblPorcentajeRango.Text = porcentajeRango + "%";
    }

    /**
     * M�todo que obtiene las lecturas de glucosa y sus horas del �ltimo d�a del usuario logeado espec�fico
     */
    public async void ObtenerDatos24H()
    {
        tokenUsuario.Text = "Token -> " + Preferences.Get("currentToken", "unknown");
        Usuario us = await dataService.ObtenerUsuario(usuarioActual);
        lblUsername.Text = us.nombre;

        var token = await dataService.ObtenerTokenUserEspecifico(usuarioActual); // Obtiene el token del usuario con el correo indicado

        tokenCurrentUser = token[0].token;
        Preferences.Set("currentToken", tokenCurrentUser);

        dataService.MostrarGrafico(glucoChart, tokenCurrentUser, lblUltimoValor, imgFlecha, lblNull);
        ObtenerEstadisticas();

        dataService.IsBusy = false;
    }


    //Skeleton
    private async void OnIsBusyChanged(object sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == "IsBusy" && dataService.IsBusy)
        {
            ObtenerDatos24H(); // Llenar el gr�fico cuando IsBusy se convierte en true

        }
    }

    //Para que al volver de nuevo a la p�gina se muestre el skeleton de carga sin los datos
    protected override async void OnAppearing()
    {
        lblUltimoValor.Text = "";
        ObtenerDatos24H();
        glucoChart.Chart = null;
        imgFlecha.Source = "";
        base.OnAppearing();
    }


}