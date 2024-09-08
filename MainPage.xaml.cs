using MauiApp1.Modelos;
using MauiApp1.Pages;
using MauiApp1.Services;
using Microsoft.Maui.ApplicationModel.Communication;
using Microsoft.Maui.Controls;
using Microsoft.Maui.Controls.Compatibility;
using Supabase;
using System.Security.Authentication;
using System.Security.Cryptography.X509Certificates;
using System.Xml.Xsl;
//using static Android.Provider.ContactsContract.CommonDataKinds;

namespace MauiApp1
{
    public partial class MainPage : ContentPage
    {

        //TODO: No hardcodear
        static string url = "https://yvpjuvlkyawxwyjewoky.supabase.co";
        static string key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl2cGp1dmxreWF3eHd5amV3b2t5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIwNjMwMTAsImV4cCI6MjAyNzYzOTAxMH0.xufHGdIXdy-8sjhN0iGQ-RZyC6AwCT_206hxtoxSoJw";
        static SupabaseOptions options = new SupabaseOptions
        {
            AutoRefreshToken = true,
            AutoConnectRealtime = true,
        };

        static Client supabaseClient = new Supabase.Client(url, key, options);

        DataService dataService = new DataService(supabaseClient);

        public MainPage()
        {
            var builder = MauiApp.CreateBuilder();

            InitializeComponent();

        }


        public async void IniciarSesion(object sender, EventArgs e)
        {
            try
            {
                layoutCarga.IsVisible = true;
                //Método propio de Supabase que inicia sesión como usuario en la app
                var session = await supabaseClient.Auth.SignIn(entryEmail.Text, entryPassword.Text);

                Preferences.Set("currentUser", entryEmail.Text);

                (Application.Current as App).ShowTabBar(); //Pone el tabbar inferior
                await Navigation.PushAsync(new Perfil());

                layoutCarga.IsVisible = false;

            }
            catch (Supabase.Gotrue.Exceptions.GotrueException)
            {
                await DisplayAlert("Error", "Las credenciales no son correctas.", "OK");
                layoutCarga.IsVisible = false;
            }

        }

        /**
         * Método que anima el botón de login
         */
        public void Animar(object sender, EventArgs e)
        {
            gridLoginForm.IsVisible = true;
            btnLogin.IsVisible = false;
            gridLoginForm.ScaleYTo(1.2, 1250, Easing.BounceOut);
        }

        //Navegación entre ventanas
        public async void IrARegistro(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new Registro());
        }
    }



}
