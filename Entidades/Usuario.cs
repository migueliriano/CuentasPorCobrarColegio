using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Usuario
    {
        public string id { get; set; }
        public string nombre { get; set; }
        public string primerApellido { get; set; }
        public string segundoApellido { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string clave { get; set; }

        public Usuario(Dictionary<string,string> datosUsuario)
        {
            this.id = datosUsuario["id"];
            this.nombre = datosUsuario["nombre"];
            this.primerApellido = datosUsuario["primerApellido"];
            this.segundoApellido = datosUsuario["segundoApellido"];
            this.direccion = datosUsuario["direccion"];
            this.telefono = datosUsuario["telefono"];
            this.clave = datosUsuario["clave"];
        }
    }
}
