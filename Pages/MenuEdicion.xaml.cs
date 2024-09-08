using MauiApp1.Modelos;
using MauiApp1.Services;
using Supabase;
using Supabase.Interfaces;
//using Windows.Networking.NetworkOperators;

namespace MauiApp1.Pages;

public partial class PopUpMenu : ContentPage
{

    static string url = "SUPABASE URL GOES HERE";
    static string key = "SUPABASE KEY GOES HERE";

    static SupabaseOptions options = new SupabaseOptions
    {
        AutoRefreshToken = true,
        AutoConnectRealtime = true,
    };

    static Client supabaseClient = new Client(url, key, options);

    DataService dataService = new DataService(supabaseClient);

    public PopUpMenu()
	{
		InitializeComponent();
        EstablecerEstadoToggle();



    }

    public void VolverAtras(object sender, EventArgs e)
    {
        Navigation.PopModalAsync();
    }

    /**
     * Establece si est� activo o no al abrir el men�
     */
    public async void EstablecerEstadoToggle()
    {
        string correoPref = Preferences.Get("currentUser", "unknown");
        var usuario = await supabaseClient.From<Usuario>().Where(x => x.correo == correoPref).Get();

        if (usuario.Model.perfilPublico)
        {
            switchVisibilidad.IsToggled = false;//Inactivo -> Perfil p�blico
            lblVisibilidad.Text = "P�blico";
            lblVisibilidad.TextColor = Colors.Green;
        }
        else
        {
            switchVisibilidad.IsToggled = true; // Activo -> Perfil privado
            lblVisibilidad.Text = "Privado";
            lblVisibilidad.TextColor = Colors.Red;
        }
    }

    /**
     * M�todo que cambia el ajuste de la visibilidad del perfil seg�n el estado del switch
     */
    private void CambiarVisibilidad(object sender, ToggledEventArgs e)
    {
        //Switch activo -> Perfil privado
        if (switchVisibilidad.IsToggled)
        {
            lblVisibilidad.Text = "Privado";
            lblVisibilidad.TextColor = Colors.Red;
            dataService.CambiarVisibilidad(Preferences.Get("currentUser", "unknown"), false);
        }
        //Switch inactivo -> Perfil p�blico
        else
        {
            lblVisibilidad.Text = "P�blico";
            lblVisibilidad.TextColor = Colors.Green;
            dataService.CambiarVisibilidad(Preferences.Get("currentUser", "unknown"), true);

        }
    }

    private void btnCambiarImagen_Clicked(object sender, EventArgs e)
    {
        DisplayAlert("Funci�n en desarrollo", "�El cambio de imagen estar� disponible en la pr�xima versi�n!", "OK");
    }
}