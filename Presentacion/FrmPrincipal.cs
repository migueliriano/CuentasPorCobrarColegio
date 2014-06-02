using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Logica;
using Entidades;

namespace Presentacion
{
    public partial class FrmPrincipal : Form
    {
        private static FrmMantenimientoEstudiante manEstudiante;
        private static FrmMantenimientoUsuario manUsuario;
        private static FrmMantenimientoFamilia manFamilia;
        public FrmPrincipal()
        {
            InitializeComponent();
        }

        private void FrmPrincipal_Load(object sender, EventArgs e)
        {
            try
            {
                MenuBL consulta = new MenuBL();
                DataSet DsMenu = new DataSet();
                DataSet DsSubmenu = new DataSet();

                DsMenu = consulta.buscarMenu();
                DsSubmenu = consulta.buscarSubMenu();

                CreateMenu(DsMenu.Tables["MenuOpciones"], DsSubmenu.Tables["SubMenuOpciones"]);
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void CreateMenu(DataTable dtMenus, DataTable dtSubMenus)
        {
            foreach (DataRow row in dtMenus.Rows)
            {

                ToolStripMenuItem menuItem = new ToolStripMenuItem();

                menuItem.Text = Convert.ToString(row["Nombre"]);
                
                menuItem.Click += this.MenuItemOnClick;
                
                int idMenu = Convert.ToInt32(row["IdMenu"]);
                
                DataRow[] rows = dtSubMenus.Select("IdMenu = " + idMenu);

                foreach (DataRow r in rows)
                {
                    ToolStripMenuItem subItem = new ToolStripMenuItem();
                    subItem.Text = Convert.ToString(r["Nombre"]);
                    subItem.Click += MenuItemOnClick;

                    menuItem.DropDownItems.Add(subItem);
                }

                this.menuPrincipal.Items.Add(menuItem);

                this.MainMenuStrip = menuPrincipal;
            }
        }

        private void MenuItemOnClick(object sender, EventArgs e)
        {
            // Referenciamos el control que ha desencadenado el evento
            ToolStripMenuItem item = (ToolStripMenuItem)sender;
            switch (item.ToString())
            {
                case "Alumnos":
                    manEstudiante = FrmMantenimientoEstudiante.getInstance();
                    manEstudiante.MdiParent = this;
                    manEstudiante.Show();
                    break;
                case "Usuario":
                    manUsuario = FrmMantenimientoUsuario.getInstance();
                    manUsuario.MdiParent = this;
                    manUsuario.Show();
                    break;
                case "Familia":
                    manFamilia = FrmMantenimientoFamilia.getInstance();
                    manFamilia.MdiParent = this;
                    manFamilia.Show();
                    break;
                default:
                    return;
            }
        }

        private void FrmPrincipal_FormClosed(object sender, FormClosedEventArgs e)
        {
            Application.Exit();
        }
    }
}
