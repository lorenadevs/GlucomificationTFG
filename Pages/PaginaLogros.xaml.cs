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
using XAct;
using System.ComponentModel;
using System.Runtime.CompilerServices;
//using Android.Graphics.Fonts;
namespace MauiApp1.Pages;

public partial class PaginaLogros : ContentPage
{
    static string url = "SUPABASE URL GOES HERE";
    static string key = "SUPABASE KEY GOES HERE";

    static SupabaseOptions options = new SupabaseOptions
    {
        AutoRefreshToken = true,
        AutoConnectRealtime = true,
    };


    static Client supabaseClient = new Supabase.Client(url, key, options);

    static DataService dataService = new DataService(supabaseClient);


    public PaginaLogros()
	{
		InitializeComponent();

        // Establecer el contexto de enlace de datos (como el IsBusy se encuetra en la clase DataService, le asignamos su instancia)
        BindingContext = dataService;


        dataService.PropertyChanged += OnIsBusyChanged;
        dataService.IsBusy = true;


        listViewLogrosDesbloqueados.ItemTemplate = new DataTemplate(() =>
        {
            var textCell = new TextCell();
            textCell.SetBinding(TextCell.TextProperty, "nombre");
            return textCell;
        });

        listViewlogrosBloqueados.ItemTemplate = new DataTemplate(() =>
        {
            var textCell = new TextCell();
            textCell.SetBinding(TextCell.TextProperty, "nombre");
            return textCell;
        });
    }

    //Skeleton
    private async void OnIsBusyChanged(object sender, PropertyChangedEventArgs e)
    {
        if (e.PropertyName == "IsBusy" && dataService.IsBusy)
        {
            RellenarListaDesbloqueados(); // Llenar las listas cuando IsBusy se convierte en true

        }
    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();

    }

    public async void RellenarListaDesbloqueados()
    {
        List<UsuarioLogro> listaDesbloqueados = await dataService.ObtenerLogrosUsuario(Preferences.Get("currentUser", "unknown"));

        List<Logro> logrosTotales = await dataService.ObtenerLogros();

        if(listaDesbloqueados == null) //Si no tiene logros desbloqueados, solo se llena la lista de logros no desbloqueados
        {
            lblNull.IsVisible = true;
            listViewlogrosBloqueados.ItemsSource = logrosTotales;

        }
        else
        {
            List<Logro> logrosDesbloqueadosInfo = new List<Logro>();

            foreach (UsuarioLogro logro in listaDesbloqueados) //Obtener la información de los logros desbloqueados
            {
                logrosDesbloqueadosInfo.Add(await dataService.ObtenerInfoLogro(logro.logroID));
            }

            listViewLogrosDesbloqueados.ItemsSource = logrosDesbloqueadosInfo;
            listViewlogrosBloqueados.ItemsSource = await dataService.ObtenerLogrosBloqueados();

        }

        dataService.IsBusy = false;


    }

    private void listView_ItemSelected(object sender, SelectedItemChangedEventArgs e)
    {
        if (e.SelectedItem != null)
        {
            var selectedLogro = e.SelectedItem as Logro;
            if (selectedLogro != null)
            {
                DisplayAlert(selectedLogro.nombre, selectedLogro.descripcion, "OK");
            }
        }
    }
}