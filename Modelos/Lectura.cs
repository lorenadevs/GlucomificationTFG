using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;
using ColumnAttribute = Supabase.Postgrest.Attributes.ColumnAttribute;
using TableAttribute = Supabase.Postgrest.Attributes.TableAttribute;

namespace MauiApp1.Modelos
{
    [Table("glucosa")]
    public class Lectura : BaseModel
    {

        [PrimaryKey("id")]
        public int id { get; set; }

        [Column("fecha")]
        public DateTime fecha { get; set; }

        [Column("sgv")]
        public int sgv { get; set; }

        [Column("tendencia")]
        public string tendencia { get; set; }

        [Column("usuario")]
        public string usuario { get; set; }

    }
}
