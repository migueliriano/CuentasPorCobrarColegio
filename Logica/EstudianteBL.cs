using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Datos;
using Entidades;
using System.Data;

namespace Logica
{
    public class EstudianteBL
    {
        private EstudianteDAL estudianteDAL = new EstudianteDAL();

        public DataSet buscar_Estudiantes()
        {
            return estudianteDAL.buscar_Estudiantes();
        }

        public DataSet buscar_Estudiante_By_Key(int idEstudiante)
        {
            return estudianteDAL.buscar_Estudiante_By_Key(idEstudiante);
        }

        public DataSet buscar_Ultimo_Estudiante()
        {
            return estudianteDAL.buscar_Ultimo_Estudiante();
        }

        public void insertar_Estudiante(Estudiante estudiante)
        {
            estudianteDAL.insertar_Estudiante(estudiante);
        }

        public void actualizar_Estudiante(Estudiante estudiante)
        {
            estudianteDAL.actualizar_Estudiante(estudiante);
        }

        public void eliminar_Estudiante(int idEstudiante)
        {
            estudianteDAL.eliminar_Estudiante(idEstudiante);
        }

    }
}
