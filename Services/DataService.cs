using MauiApp1.Modelos;
using MauiApp1.Pages;
using Microcharts;
using MongoDB.Driver;
using SkiaSharp;
using Supabase;
using Supabase.Interfaces;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
//using static Android.Graphics.ColorSpace;
//using static Android.Graphics.ImageDecoder;
//using static Android.Media.TV.TvContract.Channels;
using static Supabase.Postgrest.Constants;

namespace MauiApp1.Services
{
    public class DataService : INotifyPropertyChanged
    {
        private Client _supabaseClient;

        public DataService(Client supabaseClient)
        {
            this._supabaseClient = supabaseClient;
        }

        //Para la carga Skeleton (animación de carga en gris en los gráficos)
        private bool isBusy;

        public bool IsBusy
        {
            get => isBusy;
            set
            {
                    isBusy = value;
                    OnPropertyChanged(); // Notificar que IsBusy ha cambiado
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged([CallerMemberName] string propertyName = null)
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }


        //Registro

        /**Pone el token especificado en valor true para no asignarlo a ningún otro usuario
        */
        public async void PonerTokenEnUso(string token)
        {
            Preferences.Set("currentToken", token); //Guarda el token en las preferencias para persistencia en la app

            var tokenActual = Preferences.Get("currentToken", "unknown");

            var update = await _supabaseClient.From<Token>().Where(x => x.token == tokenActual).Set(x => x.en_uso, true)
            .Update();
        }

        //Homepage

        /**
         * Obtiene la última lectura para ponerla superpuesta en el gráfico
         */
        public async Task<Lectura> ObtenerUltimaLectura(string tokenUsuario)
        {
            var fechaActual = DateTime.Now;
            var fechaValida = fechaActual.AddHours(-24);

            var response = await _supabaseClient.From<Lectura>().Where(x => x.usuario == tokenUsuario && x.fecha >= fechaValida).Order(x => x.fecha, Ordering.Descending).Limit(1).Get();

            if (response.Model != null)
            {
                return response.Model;
            }
            else
            {
                return null;
            }

        }

        /**
         * Obtiene las lecturas de glucosa del usuario logeado ordenándolas por fecha de más antigua a más reciente en las últimas 24 horas
         * Salta excepción cuando no encuentra resultados
         */
        public async Task<List<Lectura>> ObtenerLecturas24H(string usuario)
        {
            var resultadosGlucosa = new List<Lectura>();

            var fechaActual = DateTime.Now;
            var fechaValida = fechaActual.AddHours(-24);

            var response = await _supabaseClient.From<Lectura>().Where(x => x.usuario == usuario && x.fecha >= fechaValida).Order(x => x.fecha, Ordering.Ascending).Get();

            resultadosGlucosa = response.Models;

            return resultadosGlucosa.Count == 0 ? null : resultadosGlucosa;

        }

        /**
         * Todas las lecturas con fecha mayor al día actual - 168 horas (7 días)
         */
        public async Task<int> ObtenerLecturasSemanales(string usuario)
        {
            var resultadosGlucosa = new List<Lectura>();

            var fechaActual = DateTime.Now;
            var fechaValida = fechaActual.AddHours(-168);

            var response = await _supabaseClient.From<Lectura>().Where(x => x.usuario == usuario && x.fecha >= fechaValida).Order(x => x.fecha, Ordering.Ascending).Get();

            resultadosGlucosa = response.Models;

            return resultadosGlucosa.Count;

        }

        /**
         * Porcentaje de tiempo que ha estado en un rango entre 70 y 180 en la última semana
         */
        public async Task<int> ObtenerPorcentajeRango(string tokenUsuario)
        {
            var response = await _supabaseClient.From<Lectura>().Where(x => x.usuario == tokenUsuario).Order(x => x.fecha, Ordering.Ascending).Get();

            int contValoresValidos = 0;
            int contValorRango = 0;

            foreach (var item in response.Models)
            {
                //Si la fecha está en el rango de 1 semana
                if ((item.fecha <= DateTime.Now) && (item.fecha >= DateTime.Now.AddDays(-7)))
                {
                    if (item.sgv >= 70 && item.sgv <= 180)
                    {
                        contValorRango++;
                    }

                    contValoresValidos++;
                }

            }

            if (contValoresValidos == 0)
            {
                return 0;
            }

            double porcentaje = ((double)contValorRango / (double)contValoresValidos)*100;

            return (int)porcentaje;
        }

        /**
         * Obtiene todas las lecturas de glucosa del usuario logeado ordenándolas por fecha de más antigua a más reciente
         */
        public async Task<List<Lectura>> ObtenerLecturasTotales()
        {
            var tokenActual = Preferences.Get("currentToken", "unknown");

            var response = await _supabaseClient.From<Lectura>().Where(x => x.usuario == tokenActual).Order(x => x.fecha, Ordering.Ascending).Get();

            var resultadosGlucosa = response.Models;

            if(response.Models.Count == 0)
            {
                return null;
            }
            else
            {
                return resultadosGlucosa;
            }

        }

        /** Obtiene el token del usuario específico para ponerlo en preferencias y asegurar persistencia de datos
         * 
         */
        public async Task<List<Usuario>> ObtenerTokenUserEspecifico(string usuario)
        {
            var response = await _supabaseClient.From<Usuario>().Where(x => x.correo == usuario).Get();
            var token = response.Models;

            return token;

        }

        //Función necesaria para obtener el mayor ID, sumar 1 y no repetirlos (no funcionaba el ser autoincremental en Supabase)
        public async Task<List<Usuario>> ObtenerUltimoId()
        {
            var response = await _supabaseClient.From<Usuario>().Select("id").Order(x => x.id, Ordering.Descending).Limit(1).Get();
            var resultadosGlucosa = response.Models;
            return resultadosGlucosa;
        }

        /**
         * Obtiene todos los logros de la BD
         */
        public async Task<List<Logro>> ObtenerLogros()
        {
            var logros = await _supabaseClient.From<Logro>().Get();

            return logros.Models.Count == 0 ? null : logros.Models;
        }

        /**
         * Obtiene todos los logros desbloqueados del usuario, para así poner la imagen de estos a color. Los no desbloqueados se mostrarán en blanco y negro.
         */
        public async Task<List<UsuarioLogro>> ObtenerLogrosUsuario(string correoUsuario)
        {
            var logros = await _supabaseClient.From<UsuarioLogro>().Where(x => x.usuarioMail == correoUsuario).Get();


            return logros.Models.Count == 0 ? null : logros.Models; //Si la lista tiene valores devolver estos, si no, devolver valor nulo

        }

        /**
         * Establece en true el campo 'mostrado' de un logro específico. De esta manera no se repetirá la animación de obtención de logro
         */
        public async Task EstablecerLogroMostrado(int id, string mail)
        {
            var response = await _supabaseClient.From<UsuarioLogro>().Where(x => x.logroID == id && x.usuarioMail == mail).Set(x => x.mostrado, true).Update();

        }


        /**
         * Devuelve la descripción del logro con dicho ID
         */
        public async Task<Logro> ObtenerInfoLogro(int id)
        {
            var logros = await _supabaseClient.From<Logro>().Where(x => x.id == id).Get();
            return logros.Model;
        }


        /**
         * Obtiene un token de la base de datos que tenga el campo en_uso como false
         */
        public async Task<List<Token>> GenerarToken()
        {
            var tokenGenerado = await _supabaseClient.From<Token>().Select("token").Where(x => x.en_uso == false).Limit(1).Get();

            return tokenGenerado.Models;
        }


        /**
         * Método para plasmar los valores de las últimas 24 horas en el gráfico
         */
        public int ObtenerValoresGrafico(Task<List<Lectura>> valores)
        {
            int contmenos70 = 0;
            int contmas70 = 0;
            int contrango = 0;

            List<ChartEntry> entradasGrafico = new List<ChartEntry>();

            foreach (var lectura in valores.Result)
            {
                if (lectura.sgv >= 70 && lectura.sgv <= 180)
                {
                    contrango++;
                }
                else if (lectura.sgv < 70)
                {
                    contmenos70++;
                }
                else
                {
                    contmas70++;
                }

                ChartEntry entry = new ChartEntry(lectura.sgv)
                {
                    Label = lectura.fecha.ToString("HH:mm"),
                    ValueLabel = lectura.sgv.ToString(),
                    Color = SkiaSharp.SKColor.Parse("#FF1493")
                };

                entradasGrafico.Add(entry);

            }
            return contrango;
        }

        //Perfil

        //Obtener información del usuario dado su correo (lo cual es aquello que guardamos en el Preferences)
        public async Task<Usuario> ObtenerUsuario(string correoUsuario)
        {
            var usuarioObtenido = await _supabaseClient.From<Usuario>().Where(x => x.correo == correoUsuario).Get();
            return usuarioObtenido.Model;
        }

        //Cambia la privacidad del perfil del usuario logeado
        public async void CambiarVisibilidad(string correoUsuario, bool visibilidad)
        {
            var response = await _supabaseClient.From<Usuario>().Where(x => x.correo == correoUsuario).Set(x => x.perfilPublico, visibilidad).Update();
        }

        //Comprobar si el perfil es público o privado
        public async Task<bool> ComprobarPerfilPublico(string nombre_usuario)
        {
            var response = await _supabaseClient.From<Usuario>().Where(x => x.nombre_usuario == nombre_usuario).Get();
            var usuarioObtenido = response.Model;

            return usuarioObtenido.perfilPublico;
        }


        //Lógica obtención logros
        /**
        * Función útil para realizar operaciones de únicamente las últimas 24 horas
        */
        public static DateTime ObtenerFecha24H()
        {
            var fechaActual = DateTime.Now;
            return fechaActual.AddHours(-24);
        }


        /**
         * Logro que se desbloquea al realizar la primera lectura
         */
        public async void LogroPrimeraLectura()
        {
            const int ID = 1;

            var tokenActual = Preferences.Get("currentToken", "unknown");

            var lecturasRealizadas = await _supabaseClient.From<Lectura>().Where(x => x.usuario == tokenActual).Get();

            var currentMail = Preferences.Get("currentUser", "unknown");
            var usuLo = new UsuarioLogro
            {
                logroID = ID,
                usuarioMail = currentMail,
                mostrado = false
            };
            
            var estaObtenido = await ComprobarSiEstaObtenido(ID);

            if (lecturasRealizadas.Models.Count >= 1 && !estaObtenido)
            {
                await _supabaseClient.From<UsuarioLogro>().Insert(usuLo);
            }

        }

        /**
         * Comprueba que un logro aún no haya sido desbloqueado por el usuario
         */
        public async Task<bool> ComprobarSiEstaObtenido(int idLogro)
        {
            var usuarioMail = Preferences.Get("currentUser", "unknown");
            var resultado = await _supabaseClient.From<UsuarioLogro>()
                                                 .Where(x => x.logroID == idLogro && x.usuarioMail == usuarioMail)
                                                 .Get();
            if (resultado.Models.Count == 0)
            {
                return false;
            }
            else
            {
                return true;
            }
        }


        /**
         * Devuelve si el usuario ha realizado todas las lecturas recomendadas (>=12) en las últimas 24 horas
         */
        public async void LogroTodasLecturas24H()
        {
            const int ID = 2; 
            List<Lectura> lecturas = await ObtenerLecturas24H(Preferences.Get("currentToken", "unknown"));

            if(lecturas.Count >= 12 && await ComprobarSiEstaObtenido(ID) == false)
            {
                await _supabaseClient.From<UsuarioLogro>().Insert(new UsuarioLogro
                {
                    logroID = ID,
                    usuarioMail = Preferences.Get("currentUser", "unknown"),
                    mostrado = false
                });
            }
        }


        /**
         * Devuelve true si el usuario no ha tenido ninguna hipo ni hiperglucemia en las últimas 24 horas
         */
        public async void LogroGlucosaEnRango24H()
        {
            const int ID = 3;

            var fechaActual = DateTime.Now;
            var fechaValida = fechaActual.AddHours(-24);
            bool logroDesbloqueable = true;

            string tokenActual = Preferences.Get("currentToken", "unknown");

            var lecturasRealizadas = await _supabaseClient.From<Lectura>().Where(x => x.usuario == tokenActual && x.fecha >= fechaValida).Get();

            foreach (Lectura valor in lecturasRealizadas.Models)
            {
                if (valor.sgv < 70 || valor.sgv > 180)
                {
                    logroDesbloqueable = false;
                }
            }

            if (logroDesbloqueable && await ComprobarSiEstaObtenido(ID) == false)
            {
                await _supabaseClient.From<UsuarioLogro>().Insert(new UsuarioLogro
                {
                    logroID = ID,
                    usuarioMail = Preferences.Get("currentUser", "unknown"),
                    mostrado = false
                });
            }
        }

        public async Task<List<Logro>> ObtenerLogrosBloqueados()
        {
            List<UsuarioLogro> listaDesbloqueados = await ObtenerLogrosUsuario(Preferences.Get("currentUser", "unknown"));

            List<Logro> logrosTotales = await ObtenerLogros();

            List<string> logrosDesbloqueados = new List<string>();
            List<Logro> logrosNoDesbloqueados = new List<Logro>();

            foreach (Logro logro in logrosTotales) //TODO: Catchear nulos
            {
                bool desbloqueado = false;
                foreach (UsuarioLogro logroDesbloqueado in listaDesbloqueados)
                {
                    if (logro.id == logroDesbloqueado.logroID && desbloqueado != true) //Será equivalente si tienen el mismo ID
                    {
                        desbloqueado = true;
                        Logro logroInfo = await ObtenerInfoLogro(logroDesbloqueado.logroID);

                        logrosDesbloqueados.Add(logroInfo.descripcion);
                    }
                }
                if (!desbloqueado)
                {
                    logrosNoDesbloqueados.Add(logro);
                }
            }

            return logrosNoDesbloqueados;
        }


        /**
         * Comprueba si el usuario ha desbloqueado algún logro nuevo. Se llama al entrar en el perfil
         */
        public void ComprobarNuevosLogros()
        {
            LogroPrimeraLectura();
            LogroGlucosaEnRango24H();
            LogroTodasLecturas24H();
        }


        //Pantalla de búsqueda

        /**
         * Lista de usuarios en toda la BD
         */
        public async Task<List<Usuario>> ObtenerListadoUsuarios()
        {
            var usuarios = await _supabaseClient.From<Usuario>().Get();
            return usuarios.Models;
        }

        /**
         * Obtiene los usuarios que coincidan con el texto introducido en la barra de búsqueda
         */
        public async Task<List<Usuario>> BuscarUsuario(string textoBusqueda)
        {
            var listaFiltrada = await _supabaseClient.From<Usuario>().Where(x => x.nombre_usuario.Contains(textoBusqueda.ToLower())).Get();
            //textoBusqueda.ToLower()

            return listaFiltrada.Models;
        }

        //Mostrado de gráficos

        /**
         * El primer parámetro es el propio gráfico, el segundo es el token del usuario para facilitar las consultas y el tercero es el label que muestra el último valor de glucosa
         * Este método se llama desde el perfil y el home
         */
        public async void MostrarGrafico(Microcharts.Maui.ChartView glucoChart, string tokenUsuario, Label lblUltimoValor, Image imgFlecha, Label lblNull)
        {
            List<Lectura> lecturas = await ObtenerLecturas24H(tokenUsuario);

            if (lecturas != null)
            {
                //Transformar las lecturas en entradas para el gráfico
                var entries = new List<ChartEntry>();
                foreach (var lectura in lecturas)
                {
                    int sgv = lectura.sgv;

                    SKColor color;

                    //Control de colores para saber si la glucosa está en rango o no
                    if (sgv <= 180 && sgv >= 70)
                    {
                        color = SKColor.Parse("#60F615"); //Verde
                        lblUltimoValor.TextColor = Color.FromArgb("#60F615");
                    }
                    else if (sgv >= 180)
                    {
                        color = SKColor.Parse("#FFDA33"); //Amarillo
                        lblUltimoValor.TextColor = Color.FromArgb("#FFDA33");
                    }
                    else
                    {
                        color = SKColor.Parse("#F61515"); //Rojo
                        lblUltimoValor.TextColor = Color.FromArgb("#F61515");
                    }

                    var entry = new ChartEntry(lectura.sgv)
                    {
                        ValueLabel = sgv.ToString(),
                        Color = color,
                        Label = lectura.fecha.ToString("HH:mm")

                    };
                    entries.Add(entry);
                }

                //Formateo del gráfico
                glucoChart.Chart = new LineChart
                {
                    Entries = entries,
                    LineSize = 8,
                    PointSize = 20,
                    LabelTextSize = 0,
                    MaxValue = 400,
                    MinValue = 30,
                    LabelOrientation = Orientation.Horizontal,
                    ValueLabelOrientation = Orientation.Horizontal

                };

                Lectura ultLectura = await ObtenerUltimaLectura(tokenUsuario);
                lblUltimoValor.Text = ultLectura.sgv.ToString();

                MostrarTendencia(tokenUsuario, imgFlecha);

            }
            else
            {
                lblUltimoValor.Text = "";
                lblNull.IsVisible = true;
            }
            
        }


        /**
         * Muestra una flecha subiendo, bajando o recta dependiendo de la tendencia de la última lectura de glucosa
         */
        public async void MostrarTendencia(string tokenUsuario, Image imgFlecha)
        {
            Lectura lectura = await ObtenerUltimaLectura(tokenUsuario);

            if (lectura != null)
            {
                if (lectura.tendencia.Equals("UP"))
                {
                    imgFlecha.Source = "uparrow.png";
                }
                else if (lectura.tendencia.Equals("DOWN"))
                {
                    imgFlecha.Source = "downarrow.png";
                }
                else if (lectura.tendencia.Equals("STRAIGHT"))
                {
                    imgFlecha.Source = "rightarrow.png";
                }
            }

        }


        //Ranking semanal

        public async Task<List<int>> ObtenerPuestoSemanalTodosUsuarios()
        {
            //Consulta que sume todos los valores de glucosa de la última semana
            var response = await _supabaseClient.From<Lectura>().Get();

            List<int> mediaUsuarios = new List<int>();
            //De cada usuario, sacar sus valores registrados

            var listadoUsuarios = await ObtenerListadoUsuarios();
            foreach (Usuario usu in listadoUsuarios)
            {

                int sumaValores = 0;
                int numValoresValidos = 0;

                foreach (var lectura in response.Models)
                {
                    if (lectura.usuario == usu.token)
                    {

                        if (lectura.fecha >= DateTime.Now.AddDays(-7))
                        {
                            sumaValores += lectura.sgv;
                            numValoresValidos++;
                        }
                    }

                }
                if(numValoresValidos != 0)
                {
                    mediaUsuarios.Add(sumaValores / numValoresValidos);
                }
            }

            mediaUsuarios.Sort();

            return mediaUsuarios; //Devuelve el ranking de menor a mayor
        }

        public async void ObtenerPuestoSemanalUsuarioEspecifico(string tokenUsuario, Label lblRanking)
        {
            //Consulta para sumar todos los valores de glucosa de la última semana
            var response = await _supabaseClient.From<Lectura>().Where(x => x.usuario == tokenUsuario).Get();

            if (response != null)
            {
                int sumavalores = 0;
                int numValoresValidos = 0;
                int media = 0;

                foreach (var lectura in response.Models)
                {
                    if (lectura.fecha >= DateTime.Now.AddDays(-7))
                    {
                        sumavalores += lectura.sgv;
                        numValoresValidos++;
                    }
                }

                if(numValoresValidos != 0)
                {
                    media = sumavalores / numValoresValidos;
                }

                int puesto = 0;

                //Itera sobre todas las medias, y la que corresponda al usuario se le asigna un puesto

                var mediasOtrosUsers = await ObtenerPuestoSemanalTodosUsuarios();
                foreach (int num in mediasOtrosUsers)
                {
                    puesto++;

                    if (media == num)
                    {
                        lblRanking.Text += "Puesto: #" + puesto;
                    }
                }
            }


        }

        //Asigna un avatar aleatorio
        public void AsociarAvatarAleatorio(Image img)
        {
            var avatarAleatorio = "avatar" + new Random().Next(1, 7) + ".png";
            img.Source = avatarAleatorio;
            Perfil.imagenAvatar = avatarAleatorio;

        }

    }


}