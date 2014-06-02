using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Presentacion
{
    public class Error
    {
        Dictionary<string, string> Errores;

        public Error() 
        {
            //Usuario
            Errores = new Dictionary<string, string>();
            Errores.Add("txtNombreUsuario", "Por favor Digite un Nombre a Procesar");
            Errores.Add("txtPrimerApellido", "Por favor Digite un Apellido a Procesar");
            Errores.Add("txtDireccionUsuario", "Por favor Digite una Direccion a Procesar");
            Errores.Add("txtClave", "Por favor Digite una Clave a Procesar");
            //Generales
            Errores.Add("actualizado", "Su Registro ha sido Actualizado Satisfactoriamente");
            Errores.Add("creado","Su Registro ha sido Creado Satisfactoriamente");
            Errores.Add("eliminado", "Su Registro ha sido Eliminado Satisfactoriamente");
            Errores.Add("nosepuedeeliminar", "No existe un Registro a Eliminar Actualmente");
            Errores.Add("nosepuedemostrar", "No Existe un registro a mostrar con los parametros Ingresados, Verifique he intente de nuevo");
            // Estudiante
            Errores.Add("txtNombreEstudiante", "Por favor Digite un Nombre a Procesar");
            Errores.Add("txtGrado", "Por favor Digite un Grado a Procesar");
            Errores.Add("txtEstado", "Por favor Digite un Estado a Procesar");
        }

        public string getError(string key) 
        {
            return Errores[key];
        }


    }
}
