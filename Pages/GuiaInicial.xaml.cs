using MauiApp1.Modelos;

namespace MauiApp1.Pages;

public partial class GuiaInicial : ContentPage
{
    //Clase en desarrollo para mostrar una guía inicial mediante imágenes.
    public List<Diapositiva> Diapositivas { get; set; }

    public GuiaInicial()
	{

        BindingContext = this;

        Diapositivas = new List<Diapositiva>
        {
            new Diapositiva
            {
                Titulo = "first steps",
                Contenido = "first stncidunt arcu. Nam tristique a felis quis consectetur. Etiam rhoncus mollis orci.",
                Imagen = "frame1.png"
            },
            new Diapositiva
            {
                Titulo = "testing",
                Contenido = "this is a test.",
                Imagen = "frame2.png"
            },
            new Diapositiva
            {
                Titulo = "testing",
                Contenido = "this is a test.",
                Imagen = "frame3.png"
            },
        };


        InitializeComponent();
        carouselDiapositivas.BindingContext = this;


    }
}