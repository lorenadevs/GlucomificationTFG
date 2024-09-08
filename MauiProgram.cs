using Microsoft.Extensions.Logging;
using Microcharts.Maui;
using SkiaSharp.Views.Maui.Controls.Hosting;
using Maui.FreakyEffects;
//using CommunityToolkit.Maui;


namespace MauiApp1
{
    public static class MauiProgram
    {
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .UseMicrocharts()
                .UseSkiaSharp()
                //.UseMauiCommunityToolkit()

                .ConfigureEffects(effects =>
                {
                    effects.InitFreakyEffects();
                })

                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");

                    fonts.AddFont("Anthelion.ttf", "Anthelion");
                    fonts.AddFont("Mermaid Swash Caps.ttf", "Mermaid");
                    fonts.AddFont("VignettesDEMO.otf", "Vignettes");
                    fonts.AddFont("Recoleta-RegularDEMO.OTF", "Recoleta");


                });



#if DEBUG
            builder.Logging.AddDebug();

#endif

            return builder.Build();
        }
    }
}
