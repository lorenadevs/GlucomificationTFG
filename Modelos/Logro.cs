using MongoDB.Bson.Serialization.Attributes;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase.Postgrest.Models;
using ColumnAttribute = Supabase.Postgrest.Attributes.ColumnAttribute;
using TableAttribute = Supabase.Postgrest.Attributes.TableAttribute;
using Supabase.Postgrest.Attributes;

namespace MauiApp1.Modelos
{
    [Table("logro")]
    public class Logro : BaseModel
    {
        [PrimaryKey("id")]
        public int id { get; set; }

        public string nombre { get; set; }
        public string descripcion { get; set; }

        //Es true si es el mismo ID
        public bool Equals(UsuarioLogro otroLogro)
        {
            if (otroLogro == null) return false;
            return this.id == otroLogro.logroID;
        }


    }
}
