using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Familia
    {
        public int idFamilia { get; set; }
        public string nombrePadre { get; set; }
        public string primerApellidoPadre { get; set; }
        public string segundoApellidoPadre { get; set; }
        public string telefonoPadre { get; set; }
        public string nombreMadre { get; set; }
        public string primerApellidoMadre { get; set; }
        public string segundoApellidoMadre { get; set; }
        public string telefonoMadre { get; set; }
        public string direccion { get; set; }
        public string estado { get; set; }
    
       public Familia(Dictionary<string,string> datosFamilia) 
        {
            this.idFamilia = Convert.ToInt32(datosFamilia["idFamilia"]);
            this.nombrePadre = datosFamilia["nombrePadre"];
            this.primerApellidoPadre = datosFamilia["primerApellidoPadre"];
            this.segundoApellidoPadre = datosFamilia["segundoApellidoPadre"];
            this.telefonoPadre = datosFamilia["telefonoPadre"];
            this.nombreMadre = datosFamilia["nombreMadre"];
            this.primerApellidoMadre = datosFamilia["primerApellidoMadre"];
            this.segundoApellidoMadre = datosFamilia["segundoApellidoMadre"];
            this.telefonoMadre = datosFamilia["telefonoMadre"];
            this.direccion = datosFamilia["direccion"];
            this.estado = datosFamilia["estado"];
        }

    }
}
