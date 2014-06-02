using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class FamiliaDAL
    {
        private SqlCommand comandoSql = new SqlCommand();
        private Acceso acceso = new Acceso();
        private SqlDataAdapter adaptadorSql = new SqlDataAdapter();
        private DataSet dataFamilia = new DataSet();

        public DataSet BuscarFamilias() 
        {


            try
            {
                acceso.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_FamiliaLoadAll", acceso.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dataFamilia, "familias");
                return dataFamilia;
            }
            catch (Exception)
            {

                throw;
            }
            finally 
            {
                acceso.ObtenerConexion().Close();
            }
        }

        public DataSet buscarFamiliaByKey(int familiaId) 
        {


            try
            {
                acceso.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_FamiliaLoadByPrimaryKey", acceso.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@IdFamilia", familiaId);
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dataFamilia, "familiaByKey");
                return dataFamilia;
            }
            catch (Exception)
            {
                throw;
            }
            finally 
            {
                acceso.ObtenerConexion().Close();
            }
        }

        public void InsertarFamilia(Familia familia) 
        {


            try
            {
                acceso.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_FamiliaInsert", acceso.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.InsertCommand = comandoSql;
                comandoSql.Parameters.AddWithValue("@IdFamilia", familia.idFamilia);
                comandoSql.Parameters.AddWithValue("@NombrePadre", familia.nombrePadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoPadre", familia.primerApellidoPadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoPadre", familia.segundoApellidoPadre);
                comandoSql.Parameters.AddWithValue("@TelefonoPadre", familia.telefonoPadre);
                comandoSql.Parameters.AddWithValue("@NombreMadre", familia.nombreMadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoMadre", familia.primerApellidoMadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoMadre", familia.segundoApellidoMadre);
                comandoSql.Parameters.AddWithValue("@TelefonoMadre", familia.telefonoMadre);
                comandoSql.Parameters.AddWithValue("@Direccion", familia.direccion);
                comandoSql.Parameters.AddWithValue("@Estado", familia.estado);
                comandoSql.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                acceso.ObtenerConexion().Close();
            }
        }

        public DataSet buscar_Ultima_Familia()
        {


            try
            {
                acceso.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_UltimaFamilia", acceso.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dataFamilia, "ultimaFamilia");
                return dataFamilia;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                acceso.ObtenerConexion().Close();
            }
        }


        public void ActualizarFamilia(Familia familia) 
        {

            try
            {
                acceso.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_FamiliaUpdate", acceso.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.UpdateCommand = comandoSql;
                comandoSql.Parameters.AddWithValue("@IdFamilia", familia.idFamilia);
                comandoSql.Parameters.AddWithValue("@NombrePadre", familia.nombrePadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoPadre", familia.primerApellidoPadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoPadre", familia.segundoApellidoPadre);
                comandoSql.Parameters.AddWithValue("@TelefonoPadre", familia.telefonoPadre);
                comandoSql.Parameters.AddWithValue("@NombreMadre", familia.nombreMadre);
                comandoSql.Parameters.AddWithValue("@PrimerApellidoMadre", familia.primerApellidoMadre);
                comandoSql.Parameters.AddWithValue("@SegundoApellidoMadre", familia.segundoApellidoMadre);
                comandoSql.Parameters.AddWithValue("@TelefonoMadre", familia.telefonoMadre);
                comandoSql.Parameters.AddWithValue("@Direccion", familia.direccion);
                comandoSql.Parameters.AddWithValue("@Estado", familia.estado);
                comandoSql.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                acceso.ObtenerConexion().Close();
            }
        }

        public void BorrarFamilia(int familiaId) 
        {

            try
            {
                acceso.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_FamiliaDelete", acceso.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@IdFamilia", familiaId);
                adaptadorSql.DeleteCommand = comandoSql;
                comandoSql.ExecuteNonQuery();
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                acceso.ObtenerConexion().Close();
            }
        }

    }
}
