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
    public class MenuBL
    {
        private MenuDAL Menu = new MenuDAL();

        public DataSet buscarMenu()
        {
            return Menu.buscar_Menu();
        }

        public DataSet buscarSubMenu()
        {
            return Menu.buscar_SubMenu();
        }

        public DataSet buscarSubMenuByKey(int idMenu, int idSubMenu)
        {
            return Menu.Buscar_SubMenuByKeys(idMenu, idSubMenu);
        }

        public void insertMenu(Menu menu)
        {
            Menu.CreateMenu(menu.idMenu, menu.nombre, menu.activa);
        }

        public void insertSubMenu(SubMenu submenu)
        {
            Menu.CreateSubMenu(submenu.idSubMenu, submenu.idMenu, submenu.nombre, submenu.activa, submenu.imagen);
        }

        public void updateMenu(Menu menu)
        {
            Menu.UpdateMenu(menu.idMenu, menu.nombre, menu.activa);
        }

        public void updateSubMenu(SubMenu submenu)
        {
            Menu.UpdateSubMenu(submenu.idSubMenu, submenu.idMenu, submenu.nombre, submenu.activa, submenu.imagen);
        }

        public void deleteMenu(Menu menu)
        {
            Menu.DeleteMenu(menu.idMenu);
        }

        public void deleteSubMenu(SubMenu submenu)
        {
            Menu.DeleteSubMenu(submenu.idMenu, submenu.idSubMenu);
        }
    }
}
