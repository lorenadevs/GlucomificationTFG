using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ColumnAttribute = Supabase.Postgrest.Attributes.ColumnAttribute;
using TableAttribute = Supabase.Postgrest.Attributes.TableAttribute;
using System.Threading.Tasks;

namespace MauiApp1.Modelos
{
    [Table("token")]
    public class Token : BaseModel
    {
        [PrimaryKey("token")]
        public string token { get; set; }

        [Column("en_uso")]
        public bool en_uso { get; set; }


    }
}
