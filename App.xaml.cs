using MauiApp1.Pages;
using System.Diagnostics;
using System.Runtime.ExceptionServices;

namespace MauiApp1
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            AppDomain.CurrentDomain.FirstChanceException += CurrentDomain_FirstChanceException;


            MainPage = new NavigationPage(new MainPage());

            Current.UserAppTheme = AppTheme.Light;
        }

        /**
         * Tras el login, hacer que se muestre la barra inferior
         */
        public void ShowTabBar()
        {
            MainPage = new AppShell();
        }


        private void CurrentDomain_FirstChanceException(object sender, FirstChanceExceptionEventArgs e)
        {
            Debug.WriteLine($"***** Handling Unhandled Exception *****: {e.Exception.Message}");

        }
    }
}
