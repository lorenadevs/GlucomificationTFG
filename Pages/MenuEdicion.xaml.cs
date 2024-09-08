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
     * Establece si está activo o no al abrir el menú
     */
    public async void EstablecerEstadoToggle()
    {
        string correoPref = Preferences.Get("currentUser", "unknown");
        var usuario = await supabaseClient.From<Usuario>().Where(x => x.correo == correoPref).Get();

        if (usuario.Model.perfilPublico)
        {
            switchVisibilidad.IsToggled = false;//Inactivo -> Perfil público
            lblVisibilidad.Text = "Público";
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
     * Método que cambia el ajuste de la visibilidad del perfil según el estado del switch
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
        //Switch inactivo -> Perfil público
        else
        {
            lblVisibilidad.Text = "Público";
            lblVisibilidad.TextColor = Colors.Green;
            dataService.CambiarVisibilidad(Preferences.Get("currentUser", "unknown"), true);

        }
    }

    private void btnCambiarImagen_Clicked(object sender, EventArgs e)
    {
        DisplayAlert("Función en desarrollo", "¡El cambio de imagen estará disponible en la próxima versión!", "OK");
    }
}