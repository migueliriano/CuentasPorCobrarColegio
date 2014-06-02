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
    public partial class FrmMantenimientoEstudiante : Form
    {
        private static FrmMantenimientoEstudiante instance = null;
        int Id = 0;
        Error error;

        public FrmMantenimientoEstudiante()
        {
            InitializeComponent();
            error = new Error();
        }

        public static FrmMantenimientoEstudiante getInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new FrmMantenimientoEstudiante();
            }
            instance.BringToFront();
            return instance;
        }

        private void FrmMantenimientoEstudiante_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }

        public void Limpiar(params TextBox[] textBoxes)
        {
            rbCodigo.Checked = false;
            rbNombre.Checked = false;
            foreach (TextBox text in textBoxes)
            {
                text.Clear();
            }
            Id = 0;
            this.txtIdEstudiante.Focus();
        }

        private void mostrarError(string mensaje)
        {
            MessageBox.Show(mensaje);
        }

        public void llenarGrid()
        {
            EstudianteBL estudianteBL = new EstudianteBL();
            dgvEstudiante.DataSource = estudianteBL.buscar_Estudiantes();
            dgvEstudiante.DataMember = "Estudiantes";
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            Limpiar(txtIdEstudiante, txtNombreEstudiante, txtPrimerApellido, txtSegundoApellido, txtDireccionEstudiante, txttelefonoEstudiante,
                txtEstado, txtnombreMadre, txtprimerApellidoMadre, txtprimerApellidoMadre, txtsegundoApellidoMadre, txtnombrePadre,
                txtprimerApellidoPadre, txtsegundoApellidoPadre, txtGrado, txtEstado);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            buscarEstudiantePorCodigo();
        }

        private void buscarEstudiantePorCodigo()
        {
            string table = "EstudianteByKey";
            if (txtIdEstudiante .Text == "" && txtParametroBusqueda.Text == "") return;
            DataSet datosEstudiante = new DataSet();
            int idEstudiante = (txtIdEstudiante.Text == "" && rbCodigo.Checked == true) ? Convert.ToInt32(txtParametroBusqueda.Text) : Convert.ToInt32(this.txtIdEstudiante.Text);
            EstudianteBL estudianteBL = new EstudianteBL();
            datosEstudiante = estudianteBL.buscar_Estudiante_By_Key(idEstudiante);
            if (datosEstudiante.Tables[table].Rows.Count == 0)
            {
                string mensaje = error.getError("nosepuedemostrar");
                mostrarError(mensaje);
                Limpiar(txtIdEstudiante, txtNombreEstudiante, txtPrimerApellido, txtSegundoApellido, txtDireccionEstudiante, txttelefonoEstudiante,
                    txtEstado, txtnombreMadre, txtprimerApellidoMadre, txtprimerApellidoMadre, txtsegundoApellidoMadre, txtnombrePadre, 
                    txtprimerApellidoPadre, txtsegundoApellidoPadre,txtGrado,txtEstado);
                return;
            }
            Id = Convert.ToInt32(datosEstudiante.Tables[table].Rows[0]["IdEstudiante"]);
            this.txtNombreEstudiante.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["NombreEstudiante"]);
            this.txtPrimerApellido.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["PrimerApellidoEstudiante"]);
            this.txtSegundoApellido.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["SegundoApellidoEstudiante"]);
            this.txtDireccionEstudiante.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["Direccion"]);
            this.txttelefonoEstudiante.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["Telefono"]);
            this.txtGrado.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["GradoEstudiante"]);
            this.txtEstado.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["Estado"]);
            this.txtnombrePadre.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["NombrePadre"]);
            this.txtprimerApellidoPadre.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["PrimerApellidoPadre"]);
            this.txtsegundoApellidoPadre.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["SegundoApellidoPadre"]);
            this.txtnombreMadre.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["NombreMadre"]);
            this.txtprimerApellidoMadre.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["PrimerApellidoMadre"]);
            this.txtsegundoApellidoMadre.Text = Convert.ToString(datosEstudiante.Tables[table].Rows[0]["SegundoApellidoMadre"]);
        }

        private void validarEntradaNumero(KeyPressEventArgs e)
        {
            if (e.KeyChar == 13)
            {
                buscarEstudiantePorCodigo();
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

        private void txtParametroBusqueda_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (rbCodigo.Checked)
            {
                validarEntradaNumero(e);
            }
            else if (rbNombre.Checked)
            {
                validarEntradaLetras(e);
            }
            else
            {
                MessageBox.Show("Debe elegir un filtro para la busqueda");
                txtParametroBusqueda.Focus();
            }
        }

        private string validarCampos(params TextBox[] textboxes)
        {
            List<TextBox> camposObligatorios = new List<TextBox>();
            camposObligatorios.Add(txtNombreEstudiante);
            camposObligatorios.Add(txtGrado);
            camposObligatorios.Add(txtEstado);

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
            string campoFallido = validarCampos(txtNombreEstudiante, txtGrado, txtEstado);
            if (!(campoFallido == "pass"))
            {
                string mensaje = error.getError(campoFallido);
                mostrarError(mensaje);
                return;
            }
            GuardarEstudiante();
        }

        public Estudiante CrearEstudiante()
        {
            Dictionary<string, string> datosEstudiante = new Dictionary<string, string>();
            datosEstudiante.Add("idEstudiante", Convert.ToString(Id));
            datosEstudiante.Add("nombreEstudiante", this.txtNombreEstudiante.Text);
            datosEstudiante.Add("primerApellidoEstudiante", this.txtPrimerApellido.Text);
            datosEstudiante.Add("segundoApellidoEstudiante", this.txtSegundoApellido.Text);
            datosEstudiante.Add("direccion", this.txtDireccionEstudiante.Text);
            datosEstudiante.Add("telefono", this.txttelefonoEstudiante.Text);
            datosEstudiante.Add("nombrePadre", this.txtnombrePadre.Text);
            datosEstudiante.Add("primerApellidoPadre", this.txtprimerApellidoPadre.Text);
            datosEstudiante.Add("segundoApellidoPadre", this.txtsegundoApellidoPadre.Text);
            datosEstudiante.Add("nombreMadre", this.txtnombreMadre.Text);
            datosEstudiante.Add("primerApellidoMadre", this.txtprimerApellidoMadre.Text);
            datosEstudiante.Add("segundoApellidoMadre", this.txtsegundoApellidoMadre.Text);
            datosEstudiante.Add("gradoEstudiante", this.txtGrado.Text);
            datosEstudiante.Add("estado", this.txtEstado.Text);
            Estudiante estudiante = new Estudiante(datosEstudiante);
            return estudiante;
        }

        public void GuardarEstudiante()
        {
            string mensaje;
            EstudianteBL estudianteBL = new EstudianteBL();
            
            if (Id > 0)
            {
                Estudiante estudiante = CrearEstudiante();
                estudianteBL.actualizar_Estudiante(estudiante);
                mensaje = error.getError("actualizado");
            }
            else 
            {
                DataSet ultimoId = new DataSet();
                ultimoId = estudianteBL.buscar_Ultimo_Estudiante();
                Id = Convert.ToInt32(ultimoId.Tables["ultimoEstudiante"].Rows[0]["IdEstudiante"]) + 1;
                Estudiante estudiante = CrearEstudiante();                
                estudianteBL.insertar_Estudiante(estudiante);
                mensaje = error.getError("creado");
            }
            mostrarError(mensaje);
            Limpiar(txtIdEstudiante, txtNombreEstudiante, txtPrimerApellido, txtSegundoApellido, txtDireccionEstudiante, txttelefonoEstudiante,
                txtEstado, txtnombreMadre, txtprimerApellidoMadre, txtprimerApellidoMadre, txtsegundoApellidoMadre, txtnombrePadre,
                txtprimerApellidoPadre, txtsegundoApellidoPadre, txtGrado, txtEstado);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            eliminarEstudiante();
        }

        private void eliminarEstudiante()
        {
            if (Id == 0)
            {
                mostrarError(error.getError("nosepuedeeliminar"));
                return;
            }
            EstudianteBL estudianteBL = new EstudianteBL();
            estudianteBL.eliminar_Estudiante(Id);
            string mensaje = error.getError("eliminado");
            mostrarError(mensaje);

            Limpiar(txtIdEstudiante, txtNombreEstudiante, txtPrimerApellido, txtSegundoApellido, txtDireccionEstudiante, txttelefonoEstudiante,
                txtEstado, txtnombreMadre, txtprimerApellidoMadre, txtprimerApellidoMadre, txtsegundoApellidoMadre, txtnombrePadre,
                txtprimerApellidoPadre, txtsegundoApellidoPadre, txtGrado, txtEstado);
        }

        private void toolStripButton2_Click_1(object sender, EventArgs e)
        {
            buscarEstudiantePorCodigo();
        }

        private void txtIdEstudiante_KeyPress(object sender, KeyPressEventArgs e)
        {
            validarEntradaNumero(e);
        }

        private void tabPage1_Click(object sender, EventArgs e)
        {

        }

        private void txtParametroBusqueda_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtParametroBusqueda_KeyPress_1(object sender, KeyPressEventArgs e)
        {
            validarEntradaNumero(e);
        }

    }
}
