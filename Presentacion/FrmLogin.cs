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

namespace Presentacion
{
    public partial class FrmLogin : Form
    {
        DataSisCCC ds = new DataSisCCC();
        DataSisCCCTableAdapters.UsuarioTableAdapter consulta = new DataSisCCCTableAdapters.UsuarioTableAdapter();
        

        public FrmLogin()
        {
            InitializeComponent();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void FrmLogin_Load(object sender, EventArgs e)
        {
            consulta.Fill(ds.Usuario);
            cmbUsuario.DataSource = ds.Usuario;
            cmbUsuario.DisplayMember = "Nombre";
            cmbUsuario.ValueMember = "Id";

        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            int idUsuario = Convert.ToInt32(cmbUsuario.SelectedValue);
            string claveUsuario = txtClave.Text;
            try
            {
                UsuarioBL verficar = new UsuarioBL();
                DataSet autentication = new DataSet();
                autentication = verficar.validar_Usuario(idUsuario, claveUsuario);
                if (autentication.Tables["validarUsuario"].Rows.Count > 0)
                {
                    FrmPrincipal principal = new FrmPrincipal();
                    principal.Show();
                    this.Hide();
                }
                else
                {
                    txtClave.Text = "";
                    txtClave.Focus();
                    MessageBox.Show("Clave o Usuario Incorrecto, por favor verifique he intente de nuevo");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void txtClave_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == 13) 
            {
                btnAceptar.PerformClick();
            }
        }

        private void cmbUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

    }
}
