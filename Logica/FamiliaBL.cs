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
    public class FamiliaBL
    {
        private FamiliaDAL familiaDAL = new FamiliaDAL();

        public DataSet BuscarFamilias()
        {
            return familiaDAL.BuscarFamilias();
        }

        public DataSet buscarFamiliaByKey(int familiaId)
        {
            return familiaDAL.buscarFamiliaByKey(familiaId);
        }

        public DataSet buscar_Ultima_Familia()
        {
            return familiaDAL.buscar_Ultima_Familia();
        }

        public void InsertarFamilia(Familia familia)
        {
            familiaDAL.InsertarFamilia(familia);
        }

        public void ActualizarFamilia(Familia familia)
        {
            familiaDAL.ActualizarFamilia(familia);
        }

        public void BorrarFamilia(int familiaId)
        {
            familiaDAL.BorrarFamilia(familiaId);
        }
    }
}
