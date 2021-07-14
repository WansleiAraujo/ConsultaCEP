using System;
using Formulario.Negocio;
using Formulario.VO;

namespace Formulario.Web
{
    public partial class Consultados : System.Web.UI.Page
    {
        readonly LOG cep = new LOG();
        readonly CepNegocio cepNeg = new CepNegocio();

        protected void Page_Load(object sender, EventArgs e)
        {
            // Carrega Ano atua para as Paginas
            lblAno.Text = DateTime.Now.ToString("yyyy ");

            CarregarGrid();
        }
        
        private void CarregarGrid()
        {
            gridCliente.DataSource = cepNeg.Todos();
            gridCliente.DataBind();
        }
    }
}