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
    public class UsuarioDAL
    {

        private DataSet dsUsuario = new DataSet();
        private SqlCommand comandoSql = new SqlCommand();
        private SqlDataAdapter adaptadorSql = new SqlDataAdapter();
        private Acceso accesoConexion = new Acceso();

        public DataSet buscar_Usuarios()
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_UsuarioLoadAll", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsUsuario, "usuarios");
                return dsUsuario;
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

        public DataSet buscar_Usuario_By_Key(int idUsuario)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_UsuarioLoadByPrimaryKey", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@Id",idUsuario);
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsUsuario, "usuarioByKey");
                return dsUsuario;
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

        public DataSet buscar_Ultimo_Usuario()
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("ultimoUsuario", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsUsuario, "ultimoUsuario");
                return dsUsuario;
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

        public DataSet validar_Usuario(int idUsuario, string clave)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("validarUsuario", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@Id", idUsuario);
                comandoSql.Parameters.AddWithValue("@Clave", clave);
                adaptadorSql.SelectCommand = comandoSql;
                adaptadorSql.Fill(dsUsuario, "validarUsuario");
                return dsUsuario;
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

        public void insertar_Usuario(Usuario usuario)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_UsuarioInsert", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@Id", usuario.id);
                comandoSql.Parameters.AddWithValue("@Nombre",usuario.nombre);
                comandoSql.Parameters.AddWithValue("@PrimerApellido",usuario.primerApellido);
                comandoSql.Parameters.AddWithValue("@SegundoApellido", usuario.segundoApellido);
                comandoSql.Parameters.AddWithValue("@Direccion", usuario.direccion);
                comandoSql.Parameters.AddWithValue("@Telefono", usuario.telefono);
                comandoSql.Parameters.AddWithValue("@Clave", usuario.clave);
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

        public void actualizar_Usuario(Usuario usuario)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_UsuarioUpdate", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@Id", usuario.id);
                comandoSql.Parameters.AddWithValue("@Nombre", usuario.nombre);
                comandoSql.Parameters.AddWithValue("@PrimerApellido", usuario.primerApellido);
                comandoSql.Parameters.AddWithValue("@SegundoApellido", usuario.segundoApellido);
                comandoSql.Parameters.AddWithValue("@Direccion", usuario.direccion);
                comandoSql.Parameters.AddWithValue("@Telefono", usuario.telefono);
                comandoSql.Parameters.AddWithValue("@Clave", usuario.clave);
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

        public void eliminar_Usuario(int idUsario)
        {

            try
            {
                accesoConexion.ObtenerConexion().Open();
                comandoSql = new SqlCommand("proc_UsuarioDelete", accesoConexion.ObtenerConexion());
                comandoSql.CommandType = CommandType.StoredProcedure;
                comandoSql.Parameters.AddWithValue("@Id",idUsario);
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
