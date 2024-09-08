using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace MauiApp1.Pages;

public partial class PagAnim : ContentPage, INotifyPropertyChanged
{

    private bool isBusy;

    public bool IsBusy
    {
        get => isBusy;
        set
        {
            if (isBusy != value)
            {
                isBusy = value;
                OnPropertyChanged();
            }
        }
    }

    public event PropertyChangedEventHandler PropertyChanged;

    protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
    {
        PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
    }

    public PagAnim()
	{
		InitializeComponent();
        BindingContext = this;
	}

    private void Button_Clicked(object sender, EventArgs e)
    {
        DisplayAlert("NUM LECTURAS ","does X", "OK");


    }

    protected override async void OnAppearing()
    {
        base.OnAppearing();
        await ShowBusyIndicator();
    }

    private async Task ShowBusyIndicator()
    {
        IsBusy = true;
        await Task.Delay(10000);
        IsBusy = false;
    }
}