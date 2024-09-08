namespace MauiApp1.Pages;

//using Android.Graphics;
//using AndroidX.Browser.Trusted;
using MauiApp1.Modelos;
using MauiApp1.Services;
using Supabase;
using Supabase.Interfaces;
using System.Security.Cryptography;
using System.Text;

public partial class Registro : ContentPage
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
    
    public Registro()
	{
		InitializeComponent();


    }


    public async void RegistrarUsuario(object sender, EventArgs e)
	{
		string nombre = entryName.Text;
        string correo = entryMail.Text;
		string nickname = entryNickname.Text;
        string pass = entryPass.Text;
        string passCheck = entryPassConfirm.Text;

        try {
            if (!(nombre.Equals("") || correo.Equals("") || nickname.Equals("") || pass.Equals("") || passCheck.Equals("")))
            {

                if (pass.Equals(passCheck))
                {
                    var session = await supabaseClient.Auth.SignUp(entryMail.Text, entryPass.Text);

                    var tokens = await dataService.GenerarToken();
                    var tokenGenerado = tokens[0].token;
                    var ids = await dataService.ObtenerUltimoId();


                    var usuario = new Usuario
                        {
                            id = ids[0].id + 1, //Para no repetir el id
                            nombre = nombre,
                            nombre_usuario = nickname,
                            correo = correo,
                            token = tokenGenerado
                        };
                    dataService.PonerTokenEnUso(tokenGenerado);

                    await supabaseClient.From<Usuario>().Insert(usuario);
                    await DisplayAlert("Éxito", "Registro exitoso con token " + tokenGenerado, "OK");

                    await Navigation.PushAsync(new MainPage());


                }
            }
                else
                {
                    await DisplayAlert("Error","Las contraseñas no coinciden.", "OK");
                }
        }
        catch(NullReferenceException)
        {
            await DisplayAlert("Error", "Todos los campos son obligatorios.", "OK");
        }
        catch (Supabase.Gotrue.Exceptions.GotrueException)
        {
            await DisplayAlert("No se ha podido realizar el registro", "La contraseña debe tener 6 caracteres como mínimo | Solo pueden realizarse 3 intentos de registro por hora en Supabase. (Esto se mejorará a futuro configurando un SMTP propio).", "OK");

        }
    }
}