using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Datos
{
    public class MenuDAL
    {

        private SqlCommand ComandoSQL = new SqlCommand();
        private SqlDataAdapter AdaptadorSQL = new SqlDataAdapter();
        private Acceso AccesoDatos = new Acceso();

        public DataSet buscar_Menu()
        {
           

            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_MenuLoadAll", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                AdaptadorSQL.SelectCommand = ComandoSQL;
                AdaptadorSQL.Fill(ds, "MenuOpciones");
                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }

        }

        public DataSet buscar_SubMenu()
        {

            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_SubMenuLoadAll", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                AdaptadorSQL.SelectCommand = ComandoSQL;
                AdaptadorSQL.Fill(ds, "SubMenuOpciones");

                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }

        }

        public DataSet Buscar_OpcionesSubMenu(int idMenu)
        {


            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_BuscarSubMenu", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@idmenu", idMenu);

                AdaptadorSQL.SelectCommand = ComandoSQL;
                AdaptadorSQL.Fill(ds, "SubOpciones");

                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }

        }

        public DataSet Buscar_SubMenuByKeys(int idSubMenu, int idMenu)
        {

            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_SubMenuLoadByPrimaryKey", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@idmenu", idMenu);
                ComandoSQL.Parameters.AddWithValue("@IdSubMenu", idSubMenu);

                AdaptadorSQL.SelectCommand = ComandoSQL;
                AdaptadorSQL.Fill(ds, "SubOpciones");

                return ds;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }

        }

        public void CreateMenu(int idMenu, string nameMenu, int activa)
        {

            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_MenuInsert", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@IdMenu", idMenu);
                ComandoSQL.Parameters.AddWithValue("@Nombre", nameMenu);
                ComandoSQL.Parameters.AddWithValue("@Activa", activa);
                //ComandoSQL.ExecuteNonQuery();
                AdaptadorSQL.InsertCommand = ComandoSQL;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }
        }

        public void CreateSubMenu(int idSubMenu, int idMenu, string nameSubMenu, int activa, string imagen)
        {
 
            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_SubMenuInsert", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@IdSubMenu", idSubMenu);
                ComandoSQL.Parameters.AddWithValue("@Nombre", nameSubMenu);
                ComandoSQL.Parameters.AddWithValue("@IdMenu", idMenu);
                ComandoSQL.Parameters.AddWithValue("@Activa", activa);
                ComandoSQL.Parameters.AddWithValue("@Imagen", imagen);
                //ComandoSQL.ExecuteNonQuery();
                AdaptadorSQL.InsertCommand = ComandoSQL;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }
        }

        public void UpdateMenu(int idMenu, string nameMenu, int activa)
        {
            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_MenuUpdate", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@IdMenu", idMenu);
                ComandoSQL.Parameters.AddWithValue("@Nombre", nameMenu);
                ComandoSQL.Parameters.AddWithValue("@Activa", activa);
                //ComandoSQL.ExecuteNonQuery();
                AdaptadorSQL.UpdateCommand = ComandoSQL;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }
        }

        public void UpdateSubMenu(int idSubMenu, int idMenu, string nameSubMenu, int activa, string imagen)
        {
            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_SubMenuUpdate", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@IdSubMenu", idSubMenu);
                ComandoSQL.Parameters.AddWithValue("@Nombre", nameSubMenu);
                ComandoSQL.Parameters.AddWithValue("@IdMenu", idMenu);
                ComandoSQL.Parameters.AddWithValue("@Activa", activa);
                ComandoSQL.Parameters.AddWithValue("@Imagen", imagen);
                //ComandoSQL.ExecuteNonQuery();
                AdaptadorSQL.UpdateCommand = ComandoSQL;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }
        }

        public void DeleteMenu(int idMenu)
        {

            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_MenuDelete", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@IdMenu", idMenu);
                //ComandoSQL.ExecuteNonQuery();

                AdaptadorSQL.DeleteCommand = ComandoSQL;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }
        }

        public void DeleteSubMenu(int idMenu, int idSubMenu)
        {

            try
            {
                AccesoDatos.ObtenerConexion().Open();
                DataSet ds = new DataSet();

                ComandoSQL = new SqlCommand("proc_SubMenuUpdate", AccesoDatos.ObtenerConexion());
                ComandoSQL.CommandType = CommandType.StoredProcedure;
                ComandoSQL.Parameters.AddWithValue("@IdSubMenu", idSubMenu);
                ComandoSQL.Parameters.AddWithValue("@IdMenu", idMenu);
                //ComandoSQL.ExecuteNonQuery();
                AdaptadorSQL.DeleteCommand = ComandoSQL;

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                AccesoDatos.ObtenerConexion().Close();
            }
        }

    }
}
