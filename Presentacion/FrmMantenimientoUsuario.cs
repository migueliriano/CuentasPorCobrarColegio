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
    public partial class FrmMantenimientoUsuario : Form
    {
        int Id = 0;
        Error error;

        private static FrmMantenimientoUsuario instance = null;

        public FrmMantenimientoUsuario()
        {
            InitializeComponent();
            error = new Error();
        }

        public static FrmMantenimientoUsuario getInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new FrmMantenimientoUsuario();
            }
            instance.BringToFront();
            return instance;
        }

        public void Limpiar(params TextBox[] textBoxes)
        {
            //rbCodigo.Checked = false;
           // rbNombre.Checked = false;
            foreach (TextBox text in textBoxes)
            {
                text.Clear();
            }
            Id = 0;
            this.txtIdUsuario.Focus();
        }

        public void llenarGrid()
        {
            
            UsuarioBL usuarioBL = new UsuarioBL();
            
            dgvUsuario.DataSource = usuarioBL.buscar_Usuarios();
            dgvUsuario.DataMember = "usuarios";
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            Limpiar(txtIdUsuario, txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave, txtParametroBusqueda);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            buscarUsuarioPorCodigo();
        }

        private void buscarUsuarioPorCodigo()
        {
            if (txtIdUsuario.Text == "" && txtParametroBusqueda.Text == "") return;

            DataSet datosUsuario = new DataSet();
            int idUsuario = (txtIdUsuario.Text == "") ? Convert.ToInt32(txtParametroBusqueda.Text) : Convert.ToInt32(txtIdUsuario.Text);
            UsuarioBL usuarioBl = new UsuarioBL();
            datosUsuario = usuarioBl.buscar_Usuario_By_Key(idUsuario);
            if (datosUsuario.Tables["usuarioByKey"].Rows.Count==0) 
            {
                string mensaje = error.getError("nosepuedemostrar");
                mostrarError(mensaje);
                Limpiar(txtIdUsuario, txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave, txtParametroBusqueda);
                return;
            }
            Id = Convert.ToInt32(datosUsuario.Tables["usuarioByKey"].Rows[0]["Id"]);
            txtNombreUsuario.Text = Convert.ToString(datosUsuario.Tables["usuarioByKey"].Rows[0]["Nombre"]);
            txtPrimerApellido.Text = Convert.ToString(datosUsuario.Tables["usuarioByKey"].Rows[0]["PrimerApellido"]);
            txtSegundoApellido.Text = Convert.ToString(datosUsuario.Tables["usuarioByKey"].Rows[0]["SegundoApellido"]);
            txtDireccionUsuario.Text = Convert.ToString(datosUsuario.Tables["usuarioByKey"].Rows[0]["Direccion"]);
            txtTelefonoUsuario.Text = Convert.ToString(datosUsuario.Tables["usuarioByKey"].Rows[0]["Telefono"]);
            txtClave.Text = Convert.ToString(datosUsuario.Tables["usuarioByKey"].Rows[0]["Clave"]);
        }

        private void validarEntradaNumero(KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
            {
                buscarUsuarioPorCodigo();
            }
            else if (!(e.KeyChar == 9 || e.KeyChar == 8) && e.KeyChar < 48 || e.KeyChar > 57)
            {
                e.Handled = true;
                MessageBox.Show("Este campo solo admite numeros");
            }
        }

        private void validarEntradaLetras(KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
            {
                // buscarUsuarioPorNombre();
            }
            else if (!(e.KeyChar == 9 || e.KeyChar == 8) && !((e.KeyChar > 64 && e.KeyChar < 91) || (e.KeyChar > 96 && e.KeyChar < 123)))
            {
                e.Handled = true;
                MessageBox.Show("Este campo solo admite letras");
            }
        }

        private void txtIdUsuario_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarEntradaNumero(e);
        }

        private void txtParametroBusqueda_KeyPress(object sender, KeyPressEventArgs e)
        {
        }

        private string validarCampos(params TextBox[] textboxes)
        {
            List<TextBox> camposObligatorios = new List<TextBox>();
            camposObligatorios.Add(txtNombreUsuario);
            camposObligatorios.Add(txtDireccionUsuario);
            camposObligatorios.Add(txtClave);
            camposObligatorios.Add(txtPrimerApellido);

            foreach (TextBox campo in textboxes)
            {
                if (camposObligatorios.Contains(campo) && campo.Text == "")
                {
                    campo.Focus();
                    return campo.Name.ToString();
                }
            }
            return "pass";
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            string campoFallido = validarCampos(txtIdUsuario, txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave);
            if (!(campoFallido == "pass"))
            {
                string mensaje = error.getError(campoFallido);
                mostrarError(mensaje);
                return;
            }
            guardarUsuario();
        }

        private Usuario crearUsuario()
        {
            Dictionary<string, string> datosUsuario = new Dictionary<string, string>();
            datosUsuario.Add("id",Convert.ToString(Id));
            datosUsuario.Add("nombre",txtNombreUsuario.Text);
            datosUsuario.Add("primerApellido",txtPrimerApellido.Text);
            datosUsuario.Add("segundoApellido",txtSegundoApellido.Text);
            datosUsuario.Add("direccion",txtDireccionUsuario.Text);
            datosUsuario.Add("telefono",txtTelefonoUsuario.Text);
            datosUsuario.Add("clave",txtClave.Text);
            Usuario usuario = new Usuario(datosUsuario);
            return usuario;
        }

        private void guardarUsuario()
        {
            string mensaje;
            UsuarioBL usuarioBL = new UsuarioBL();
            if (Id > 0)
            {
                Usuario usuario = crearUsuario();
                usuarioBL.actualizar_Usuario(usuario);
                mensaje = error.getError("actualizado");
            }
            else 
            {
                DataSet ultimoId = new DataSet();
                ultimoId = usuarioBL.buscar_Ultimo_Usuario();
                Id = Convert.ToInt32(ultimoId.Tables["ultimoUsuario"].Rows[0]["Id"]) + 1;
                Usuario usuario = crearUsuario();
                usuarioBL.insertar_Usuario(usuario);
                mensaje = error.getError("creado");
            }
            mostrarError(mensaje);
            Limpiar(txtIdUsuario, txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave, txtParametroBusqueda);
        }

        private void mostrarError(string mensaje)
        {
            MessageBox.Show(mensaje);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            eliminar();
        }

        private void eliminar()
        {
            if (Id == 0)
            {
                mostrarError(error.getError("nosepuedeeliminar"));
                return;
            }
            UsuarioBL usuarioBL = new UsuarioBL();
            usuarioBL.eliminar_Usuario(Id);
            string mensaje = error.getError("eliminado");
            mostrarError(mensaje);
            Limpiar(txtIdUsuario, txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave, txtParametroBusqueda);
        }

        private void FrmMantenimientoUsuario_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {

        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void dgvUsuario_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
          
        }

        private void dgvUsuario_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0)
            {
                DataGridViewRow rowSelected = this.dgvUsuario.Rows[e.RowIndex];

                txtIdUsuario.Text = rowSelected.Cells["Id"].Value.ToString();
                txtNombreUsuario.Text = rowSelected.Cells["Nombre"].Value.ToString();
                txtPrimerApellido.Text = rowSelected.Cells["PrimerApellido"].Value.ToString();
                txtSegundoApellido.Text = rowSelected.Cells["SegundoApellido"].Value.ToString();
                txtDireccionUsuario.Text = rowSelected.Cells["Direccion"].Value.ToString();
                txtTelefonoUsuario.Text = rowSelected.Cells["Telefono"].Value.ToString();
                txtClave.Text = rowSelected.Cells["Clave"].Value.ToString();
            }
        }


    }
}
