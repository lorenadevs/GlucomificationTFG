using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using MongoDB.Driver;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase.Postgrest.Models;
using Supabase.Postgrest.Attributes;

namespace MauiApp1.Modelos
{
    [Table("usuario")]
    public class Usuario : BaseModel
    {

        [PrimaryKey("id")]
        public int id { get; set; }

        public string nombre { get; set; }
        public string nombre_usuario { get; set; }
        //public string contrasena { get; set; }
        public string correo { get; set; }
        public List<int> logros { get; set; }
        public string token { get; set; }
        public string urlImagen { get; set; }
        [Column("perfilPublico")] //Si no se especifica la columna da error al esta haber sido añadida después y no en la creación inicial de la tabla
        public bool perfilPublico { get; set; }
    }
}
