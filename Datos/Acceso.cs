using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Datos
{
    public class Acceso
    {
        // Clase de acceso a datos.

        private SqlConnection Conexion;

        //Constructor
        public Acceso()
        {
            Conexion = new SqlConnection(CadenaConexion);
        }
        private string CadenaConexion
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["Presentacion.Properties.Settings.CuentaCobrarColegioConnectionString"].ToString();
            }
        }

        public SqlConnection ObtenerConexion()
        {
            return Conexion;
        }
    }
}
