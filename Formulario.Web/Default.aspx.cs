using System;
using Formulario.Negocio;

namespace Formulario.Web
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblAno.Text = DateTime.Now.ToString("yyyy ");
        }
    }
}