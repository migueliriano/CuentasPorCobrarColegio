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
using Presentacion.DataSisCCCTableAdapters;

namespace Presentacion
{
    public partial class FrmMantenimientoUsuario : Form
    {   
        Error error;


        private static FrmMantenimientoUsuario instance = null;

        public FrmMantenimientoUsuario()
        {
            InitializeComponent();
            error = new Error();

            txtIdUsuario.Text = ultimoIdUsuario().ToString();

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

        private int ultimoIdUsuario()
        {
            UsuarioBL usuarioBL = new UsuarioBL();
            return Convert.ToInt16(usuarioBL.buscar_Ultimo_Usuario().Tables["ultimoUsuario"].Rows[0]["ultimoUser"]);
        }

        public void llenarGrid()
        {
            
            UsuarioBL usuarioBL = new UsuarioBL();
            
            dgvUsuario.DataSource = usuarioBL.buscar_Usuarios();
            dgvUsuario.DataMember = "usuarios";
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            buscarUsuarioPorCodigo();
        }

        private void habilitarTextBox(params TextBox[] textBoxes)
        {
            foreach (TextBox textBoxElement in textBoxes)
            {
                textBoxElement.BackColor = Color.White;
                textBoxElement.Enabled = true;

            }
        }
        private void desabilitarTextBox(params TextBox[] textBoxes)
        {
            foreach (TextBox textBoxElement in textBoxes)
            {
                textBoxElement.BackColor = Color.Silver;
                textBoxElement.Enabled = false;

            }
        }

        private void habilitarDesabilitarMenu(string nombreMenu)
        {
            switch (nombreMenu)
            {
                case "Nuevo":
                    BtnNuevo.Enabled = false;
                    BtnEliminar.Enabled = true;
                    BtnEditar.Enabled = false;
                    btnGuardar.Enabled = true;
                    break;

                case "Editar":
                    
                    BtnNuevo.Enabled = false;
                    BtnEditar.Enabled = false;
                    btnGuardar.Enabled = true;
                    BtnEliminar.Enabled = true;
                    break;


                case "Seleccionar" : 
                    BtnEliminar.Enabled = false;
                    BtnNuevo.Enabled = true;
                    btnGuardar.Enabled = false;
                    BtnEditar.Enabled = true;
                    break;

                default :
                    BtnNuevo.Enabled = true;
                    BtnEditar.Enabled = false;
                    btnGuardar.Enabled = false;
                    BtnEliminar.Enabled = false;
                    break;
            }
        }

        private void limpiarCampos(params TextBox[] textBoxs)
        {
            foreach (TextBox textBoxElement in textBoxs)
            {
                textBoxElement.Clear();

            }
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
                return;
            }
            //Id = Convert.ToInt32(txtIdUsuario.Text);
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


        private Usuario crearUsuario()
        {
            Dictionary<string, string> datosUsuario = new Dictionary<string, string>();
            datosUsuario.Add("id",txtIdUsuario.Text);
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

           string idActual = txtIdUsuario.Text;
           string ultimoId = ultimoIdUsuario().ToString();

           if (idActual != ultimoId)
            {
                Usuario usuario = crearUsuario();
                usuarioBL.actualizar_Usuario(usuario);
                mensaje = error.getError("actualizado");
                desabilitarTextBox(txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtClave, txtTelefonoUsuario);
                llenarGrid();
            }
            else 
            {
                Usuario usuario = crearUsuario();
                usuarioBL.insertar_Usuario(usuario);
                mensaje = error.getError("creado");
                desabilitarTextBox(txtNombreUsuario,txtPrimerApellido,txtSegundoApellido,txtDireccionUsuario,txtClave,txtTelefonoUsuario);
                llenarGrid();
            }
            mostrarError(mensaje);

        }

        private void mostrarError(string mensaje)
        {
            MessageBox.Show(mensaje);
        }

        private void eliminar()
        {
            string idActual = txtIdUsuario.Text;
            string ultimoId = ultimoIdUsuario().ToString();

            if (idActual != ultimoId)
            {
                DialogResult si_eliminar = MessageBox.Show("Seguro que decea eliminar al usuario", "Eliminar Usuario",
                    MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2);

                if (si_eliminar == DialogResult.Yes)
                {
                    UsuarioBL usuarioBL = new UsuarioBL();
                    usuarioBL.eliminar_Usuario(Convert.ToInt32(txtIdUsuario));

                    string mensaje = error.getError("eliminado");
                    mostrarError(mensaje);
                    llenarGrid();
                }
            }

            else
            {
                DialogResult si_cancelar = MessageBox.Show("No se han guardado los cambios del usuario, ¿Seguo que decea Cancelar?", "Cancelar",
                   MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button2);

                if (si_cancelar == DialogResult.Yes)
                {
                    habilitarDesabilitarMenu("");
                    desabilitarTextBox(txtNombreUsuario,txtPrimerApellido,txtSegundoApellido,txtTelefonoUsuario,txtClave,txtDireccionUsuario);
                }
            }
           
        }

        private void FrmMantenimientoUsuario_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }


        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }


        private void dgvUsuario_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
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

            habilitarDesabilitarMenu("Seleccionar");
            desabilitarTextBox(txtNombreUsuario,txtNombreUsuario,txtSegundoApellido,txtPrimerApellido,txtDireccionUsuario,txtClave,txtTelefonoUsuario);
        }

        private void BtnNuevo_Click(object sender, EventArgs e)
        {
            habilitarTextBox(txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave, txtParametroBusqueda);
            limpiarCampos(txtNombreUsuario, txtPrimerApellido, txtSegundoApellido, txtDireccionUsuario, txtTelefonoUsuario, txtClave, txtParametroBusqueda);
            habilitarDesabilitarMenu("Nuevo");
            
            txtNombreUsuario.Focus();
            txtIdUsuario.Text = ultimoIdUsuario().ToString();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
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

        private void BtnEliminar_Click(object sender, EventArgs e)
        {
            eliminar();
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {

            habilitarDesabilitarMenu("Editar");
            habilitarTextBox(txtNombreUsuario,txtPrimerApellido,txtSegundoApellido,txtTelefonoUsuario,txtDireccionUsuario,txtClave);
            txtNombreUsuario.Focus();

        }

        private void txtParametroBusqueda_TextChanged(object sender, EventArgs e)
        {
            UsuarioBL usuarioBL = new UsuarioBL();

            dgvUsuario.DataSource = usuarioBL.buscar_por_id_nombre(txtParametroBusqueda.Text);
            dgvUsuario.DataMember = "nombreIdUsuario";

        }


    }
}
