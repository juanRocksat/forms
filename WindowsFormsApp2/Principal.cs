using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Data.SqlClient;
using System.Data.Sql;
using System.Data.SqlTypes;
namespace WindowsFormsApp2
{
   
    public partial class Principal : Form
    {
        public static string palabra = "server:PACCODAN\\SQLEXPRESS ; database=GD2015C1 ; Integrated Security = true ";
        public static string palabra2= "Data Source=PACCODAN\\SQLEXPRESS;Initial Catalog=GD2015C1;Integrated Security=true";
        public static string palabra3 = "select* from Empleado";
        public static SqlConnection conexion = new SqlConnection(palabra2);
        public Principal()
        {
            InitializeComponent();
         
    }
        void conectarBD()
        {
            try{
                conexion.Open();

            }
            catch(Exception ex )
            {
                Console.WriteLine("fallo al conectar la BD "+ex.Message);
            }
        }

        private void Form1_Load(object sender, EventArgs e)
        {
        }
       public  void  mostrarSelect()
        {
            SqlCommand filtro = conexion.CreateCommand();
            filtro.CommandText = " select * from Composicion";
            SqlDataReader muestra = filtro.ExecuteReader();
            DataTable tabla = new DataTable();
            tabla.Load(muestra);
            dataGridView1.DataSource = tabla;
            MessageBox.Show("Se abrió la conexión con el servidor SQL Server y se seleccionó la base de datos");
            MessageBox.Show("Se cerró la conexión.");
            conexion.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            mostrarSelect();

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            conexion.Open();
            SqlCommand comando = new SqlCommand(palabra3, conexion);
            SqlDataReader filas = comando.ExecuteReader();
            while(filas.Read())
            {
                textBox4.AppendText(filas["empl_codigo"].ToString());
                textBox4.AppendText(" - ");
                textBox4.AppendText(filas["empl_nombre"].ToString());
                textBox4.AppendText(" - ");
                textBox4.AppendText(filas["empl_jefe"].ToString());
                textBox4.AppendText("\n");
            } ;



        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }
        static void updetear(string tabla, string deColumna, string campo)
        {
            conexion.Open();
            string comandoSQL = "insert into with  " + tabla + "("+deColumna+") values('"+campo+"')";

            //SqlCommand comando1 = conexion.CreateCommand(); -//new SqlCommand(comandoSQL, conexion);
            SqlCommand comando2 = conexion.CreateCommand();
            comando2.CommandText= comandoSQL;
            //comando2.ExecuteReader();
            comando2.ExecuteNonQuery();
            MessageBox.Show("Se Agegaron Datos crrectamente ");      
        }
        void borrarTextBoxs()
        {
            textBox1.Text = "";
            textBox2.Text = "";
            textBox3.Text = "";
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string tabla=(string)textBox1.Text,deColumna=(string)textBox2.Text;
            string deCampo = (string)textBox3.Text;
            updetear(tabla,deColumna,deCampo);
            borrarTextBoxs();
            conexion.Close();
        }
       

        private void paraAgregarDatos_TextChanged(object sender, EventArgs e)
        {
            string primerCampo = textBox1.Text;
            string segundoCampo = textBox2.Text;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
