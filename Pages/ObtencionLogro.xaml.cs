using MauiApp1.Modelos;

namespace MauiApp1.Pages;

public partial class ObtencionLogro : ContentPage
{
	public ObtencionLogro(List<Logro> logros)
	{
		InitializeComponent();

        foreach (Logro logro in logros)
		{
            verticalLayout.Add(new Label
            {
                Text = logro.nombre,
                Margin = 10,
                FontSize = 20,
                VerticalOptions = LayoutOptions.Center,
                HorizontalOptions = LayoutOptions.Center,
                FontFamily = "Anthelion"
            });

            verticalLayout.Add(new Label
            {
                Text = logro.descripcion,
                FontSize = 16,
                VerticalOptions = LayoutOptions.Center,
                HorizontalOptions = LayoutOptions.Center,
                FontFamily = "Anthelion"
            });

            verticalLayout.Add(new Image
            {
                Source = "ach" + logro.id + ".png",
                HeightRequest = 100,
                WidthRequest = 100,
                VerticalOptions = LayoutOptions.Center,
                HorizontalOptions = LayoutOptions.Center
            });

        }
    }

    public void VolverAtras(object sender, EventArgs e)
    {
        Navigation.PopModalAsync();
    }
}