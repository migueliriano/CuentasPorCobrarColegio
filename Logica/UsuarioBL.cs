using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Datos;
using Entidades;

namespace Logica
{
    public class UsuarioBL
    {
        private UsuarioDAL usuarioDAL = new UsuarioDAL();
         
        public DataSet buscar_Usuarios()
        {
            return usuarioDAL.buscar_Usuarios();
        }

        public DataSet buscar_Usuario_By_Key(int idUsuario)
        {
            return usuarioDAL.buscar_Usuario_By_Key(idUsuario);
        }

        public DataSet buscar_Ultimo_Usuario()
        {
            return usuarioDAL.buscar_Ultimo_Usuario();
        }

        public DataSet validar_Usuario(int idUsuario, string clave)
        {
            return usuarioDAL.validar_Usuario(idUsuario,clave);
        }

        public void insertar_Usuario(Usuario usuario)
        {
            usuarioDAL.insertar_Usuario(usuario);
        }

        public void actualizar_Usuario(Usuario usuario)
        {
            usuarioDAL.actualizar_Usuario(usuario);
        }

        public void eliminar_Usuario(int idUsario)
        {
            usuarioDAL.eliminar_Usuario(idUsario);
        }
    }
}
