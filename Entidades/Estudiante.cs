using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Estudiante
    {
        public string idEstudiante { get; set; }
        public string nombreEstudiante { get; set; }
        public string primerApellidoEstudiante { get; set; }
        public string segundoApellidoEstudiante { get; set; }
        public string direccion { get; set; }
        public string telefono { get; set; }
        public string nombrePadre { get; set; }
        public string primerApellidoPadre { get; set; }
        public string segundoApellidoPadre { get; set; }
        public string nombreMadre { get; set; }
        public string primerApellidoMadre { get; set; }
        public string segundoApellidoMadre { get; set; }
        public string gradoEstudiante { get; set; }
        public string estado { get; set; }

        public Estudiante(Dictionary<string,string> datosEstudiante) 
        {
            this.idEstudiante = datosEstudiante["idEstudiante"];
            this.nombreEstudiante = datosEstudiante["nombreEstudiante"];
            this.primerApellidoEstudiante = datosEstudiante["primerApellidoEstudiante"];
            this.segundoApellidoEstudiante = datosEstudiante["segundoApellidoEstudiante"];
            this.direccion = datosEstudiante["direccion"];
            this.telefono = datosEstudiante["telefono"];
            this.nombrePadre = datosEstudiante["nombrePadre"];
            this.primerApellidoPadre = datosEstudiante["primerApellidoPadre"];
            this.segundoApellidoPadre = datosEstudiante["segundoApellidoPadre"];
            this.nombreMadre = datosEstudiante["nombreMadre"];
            this.primerApellidoMadre = datosEstudiante["primerApellidoMadre"];
            this.segundoApellidoMadre = datosEstudiante["segundoApellidoMadre"];
            this.gradoEstudiante = datosEstudiante["gradoEstudiante"];
            this.estado = datosEstudiante["estado"];
        }
    }
}
