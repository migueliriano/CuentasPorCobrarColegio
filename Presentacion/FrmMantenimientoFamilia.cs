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
    public partial class FrmMantenimientoFamilia : Form
    {
        private static FrmMantenimientoFamilia instance = null;
        int Id = 0;
        Error error;

        public FrmMantenimientoFamilia()
        {
            InitializeComponent();
        }

        public static FrmMantenimientoFamilia getInstance()
        {
            if (instance == null || instance.IsDisposed)
            {
                instance = new FrmMantenimientoFamilia();
            }
            instance.BringToFront();
            return instance;
        }


        public Familia CrearFamilia()
        {
            Dictionary<string, string> datosFamilia = new Dictionary<string, string>();
            datosFamilia.Add("idFamilia", Convert.ToString(Id));
            datosFamilia.Add("nombrePadre", this.txtNombrePadre.Text);
            datosFamilia.Add("primerApellidoPadre", this.txtPrimerApellidoPadre.Text);
            datosFamilia.Add("segundoApellidoPadre", this.txtSegundoApellidoPadre.Text);
            datosFamilia.Add("telefonoPadre", this.txttelefonoPadre.Text);
            datosFamilia.Add("nombreMadre", this.txtNombreMadre.Text);
            datosFamilia.Add("primerApellidoMadre", this.txtPrimerApellidoMadre.Text);
            datosFamilia.Add("segundoApellidoMadre", this.txtSegundoApellidoMadre.Text);
            datosFamilia.Add("telefonoMadre", this.txtTelefonoMadre.Text);
            datosFamilia.Add("direccion", this.txtDireccion.Text);
            datosFamilia.Add("estado", this.txtEstado.Text);
            Familia familia = new Familia(datosFamilia);
            return familia;
        }

        public void GuardarFamilia()
        {
            string mensaje;
            FamiliaBL familiaBL = new FamiliaBL();

            if (Id > 0)
            {
                Familia familia = CrearFamilia();
                familiaBL.ActualizarFamilia(familia);
                mensaje = error.getError("actualizado");
            }
            else
            {
                DataSet ultimoId = new DataSet();
                ultimoId = familiaBL.buscar_Ultima_Familia();
                Id = Convert.ToInt32(ultimoId.Tables["ultimoEstudiante"].Rows[0]["IdEstudiante"]) + 1;
                Familia familia = CrearFamilia();
                familiaBL.InsertarFamilia(familia);
                mensaje = error.getError("creado");
            }
            mostrarError(mensaje);
            Limpiar(this.txtNombrePadre, this.txtPrimerApellidoPadre, this.txtSegundoApellidoPadre, this.txttelefonoPadre,
                            this.txtNombreMadre, this.txtPrimerApellidoMadre, this.txtSegundoApellidoMadre, this.txtTelefonoMadre,
                            this.txtDireccion, this.txtEstado);
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            Limpiar(this.txtNombrePadre,this.txtPrimerApellidoPadre,this.txtSegundoApellidoPadre,this.txttelefonoPadre,
                this.txtNombreMadre,this.txtPrimerApellidoMadre,this.txtSegundoApellidoMadre,this.txtTelefonoMadre,
                this.txtDireccion,this.txtEstado);
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
            this.txtIdFamilia.Focus();
        }

        private void eliminarFamilia()
        {
            if (Id == 0)
            {
                mostrarError(error.getError("nosepuedeeliminar"));
                return;
            }
            FamiliaBL familiaBL = new FamiliaBL();
            familiaBL.BorrarFamilia(Id);
            string mensaje = error.getError("eliminado");
            mostrarError(mensaje);

            Limpiar(this.txtNombrePadre, this.txtPrimerApellidoPadre, this.txtSegundoApellidoPadre, this.txttelefonoPadre,
                            this.txtNombreMadre, this.txtPrimerApellidoMadre, this.txtSegundoApellidoMadre, this.txtTelefonoMadre,
                            this.txtDireccion, this.txtEstado);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            //buscarFamiliaPorCodigo();
        }

        private void txtIdFamilia_KeyPress(object sender, KeyPressEventArgs e)
        {
            //validarEntradaNumero(e);
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            eliminarFamilia();
        }

        private void mostrarError(string mensaje)
        {
            MessageBox.Show(mensaje);
        }

        private void dgvEstudiante_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void FrmMantenimientoFamilia_Load(object sender, EventArgs e)
        {
            llenarGrid();
        }

        private void llenarGrid()
        {
            FamiliaBL familia = new FamiliaBL();
            dgvFamilia.DataSource = familia.BuscarFamilias();
            dgvFamilia.DataMember = "Familias";
        }

    }
}
