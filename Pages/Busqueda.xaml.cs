using MauiApp1.Modelos;
using MauiApp1.Services;
using Supabase;

namespace MauiApp1.Pages;

public partial class Busqueda : ContentPage
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


    public Busqueda()
    {
        InitializeComponent();

        //Formato para mostrar los resultados de los usuarios. Si no se especifica un ItemTemplate se muestra el objeto entero, pero solo queremos mostrar el nombre de usuario
        listViewBusqueda.ItemTemplate = new DataTemplate(() =>
        {
            var textCell = new TextCell();
            textCell.SetBinding(TextCell.TextProperty, "nombre_usuario");
            return textCell;
        });
    }

    private async void barraBusqueda_TextChanged(object sender, TextChangedEventArgs e)
    {
        SearchBar barraBusqueda = (SearchBar)sender;
        listViewBusqueda.ItemsSource = await dataService.BuscarUsuario(barraBusqueda.Text);
    }

    private void barraBusqueda_SearchButtonPressed(object sender, EventArgs e)
    {
        lblNoResultados.IsVisible = true;
        lblNoResultados.Text = "No se han encontrado resultados para la búsqueda";
    }


        private async void listViewBusqueda_ItemSelected(object sender, SelectedItemChangedEventArgs e)
    {
        if (listViewBusqueda.SelectedItem != null)
        {
            var selectedUser = e.SelectedItem as Usuario;
            await Navigation.PushModalAsync(new PerfilUsuario(selectedUser));
        }

    }

}