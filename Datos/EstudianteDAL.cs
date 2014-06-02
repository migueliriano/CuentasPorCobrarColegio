using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Entidades;
using System.Data.SqlClient;

namespace Datos
{
    public class EstudianteDAL
    {
        private SqlCommand comandoSql = new SqlCommand();
        private SqlDataAdapter adaptadorSql = new SqlDataAdapter();
        private DataSet dsEstudiante = new DataSet();
        private Acceso accesoConexion = new Acceso();

        public EstudianteDAL()
        {

        }

        public DataSet buscar_Estudiantes()
        {
            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_EstudianteLoadAll", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsEstudiante,"Estudiantes");
                return dsEstudiante;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoConexion.ObtenerConexion().Close();
            }
        }

        public DataSet buscar_Estudiante_By_Key(int idEstudiante)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_EstudianteLoadByPrimaryKey", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@IdEstudiante",idEstudiante);
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsEstudiante,"EstudianteByKey");
                return dsEstudiante;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoConexion.ObtenerConexion().Close();
            } 
        }

        public DataSet buscar_Ultimo_Estudiante()
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                //comandoSql = new SqlCommand("proc_UltimoEstudiante", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsEstudiante,"ultimoEstudiante");
                return dsEstudiante;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoConexion.ObtenerConexion().Close();
            }
        }

        public void insertar_Estudiante(Estudiante estudiante)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_EstudianteInsert", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@IdEstudiante",Convert.ToInt16(estudiante.idEstudiante));
                comandoSql.Parameters.AddWithValue("@NombreEstudiante",estudiante.nombreEstudiante);
                comandoSql.Parameters.AddWithValue("@Direccion", estudiante.direccion);
                comandoSql.Parameters.AddWithValue("@Telefono", estudiante.telefono);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoEstudiante",estudiante.primerApellidoEstudiante);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoEstudiante", estudiante.segundoApellidoEstudiante);
                comandoSql.Parameters.AddWithValue("@NombrePadre", estudiante.nombrePadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoPadre", estudiante.primerApellidoPadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoPadre", estudiante.segundoApellidoPadre);
                comandoSql.Parameters.AddWithValue("@NombreMadre", estudiante.nombreMadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoMadre", estudiante.primerApellidoMadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoMadre", estudiante.segundoApellidoMadre);
                comandoSql.Parameters.AddWithValue("@GradoEstudiante", estudiante.gradoEstudiante);
                comandoSql.Parameters.AddWithValue("@Estado", estudiante.estado);
                adaptadorSql.InsertCommand = comandoSql;
                comandoSql.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoConexion.ObtenerConexion().Close();
            }
        }

        public void actualizar_Estudiante(Estudiante estudiante)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_EstudianteUpdate", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@IdEstudiante", Convert.ToInt16(estudiante.idEstudiante));
                comandoSql.Parameters.AddWithValue("@NombreEstudiante", estudiante.nombreEstudiante);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoEstudiante", estudiante.primerApellidoEstudiante);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoEstudiante", estudiante.segundoApellidoEstudiante);
                comandoSql.Parameters.AddWithValue("@Direccion", estudiante.direccion);
                comandoSql.Parameters.AddWithValue("@Telefono", estudiante.telefono);
                comandoSql.Parameters.AddWithValue("@NombrePadre", estudiante.nombrePadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoPadre", estudiante.primerApellidoPadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoPadre", estudiante.segundoApellidoPadre);
                comandoSql.Parameters.AddWithValue("@NombreMadre", estudiante.nombreMadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoMadre", estudiante.primerApellidoMadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoMadre", estudiante.segundoApellidoMadre);
                comandoSql.Parameters.AddWithValue("@GradoEstudiante", estudiante.gradoEstudiante);
                comandoSql.Parameters.AddWithValue("@Estado", estudiante.estado);
                adaptadorSql.UpdateCommand = comandoSql;
                comandoSql.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoConexion.ObtenerConexion().Close();
            }
        }

        public void eliminar_Estudiante(int idEstudiante)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_EstudianteDelete", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@IdEstudiante",idEstudiante);
                adaptadorSql.DeleteCommand = comandoSql;
                comandoSql.ExecuteNonQuery();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoConexion.ObtenerConexion().Close();
            }
        }
    }
}
