using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MauiApp1.Modelos
{
    /**
     * Esta clase es necesaria porque Postgres no permite tener una FK de arrays, por lo que al intentar asignar varios logros a un usuario se produce un error.
     * Se ha creado una tabla alternativa únicamente de usuarios y sus respectivos logros, siendo ambos campos FK tanto de la tabla usuarios como de la tabla logros.
     */
    [Table("usuario_logros")]
    public class UsuarioLogro :  BaseModel
    {
        [PrimaryKey("id")]
        public int id { get; set; }

        [Column("logroID")]
        //Logro asociado
        public int logroID { get; set; }

        //Correo del usuario
        [Column("usuarioMail")]
        public string usuarioMail { get; set; }

        //Si se ha mostrado al usuario que lo ha desbloqueado
        [Column("mostrado")]
        public bool mostrado { get; set; }


    }
}
