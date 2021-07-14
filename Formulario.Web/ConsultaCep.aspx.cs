using System;
using System.Text.RegularExpressions;
using Formulario.Negocio;

namespace Formulario.Web
{
    public partial class ConsultaCep : System.Web.UI.Page
    {
        CepNegocio cepNeg = new CepNegocio();
        VO.LOG Cep = new Formulario.VO.LOG();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPesquisarCep_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtCep.Text != "")
                {
                    var ws = new WSCorreios.AtendeClienteClient();
                    var xml = ws.consultaCEP(txtCep.Text);
                    lblRua.Text = xml.end;
                    lblBairro.Text = xml.bairro;
                    lblCidade.Text = xml.cidade;
                    lblEstado.Text = xml.uf;
                    lblCep.Text = xml.cep;
                    
                    //Inserir Log
                    GravarLog();
                }
                else
                    lblValidaCep.Text = " Informe um CEP";

            }
            catch (Exception ex)
            {
                lblValidaCep.Text = ex.Message.ToString();
                // Erro ao pesquisar Cep
            }
        }

        private void GravarLog()
        {
            VO.LOG cep = new VO.LOG();

            cep.Cep = txtCep.Text;
            cep.Data = DateTime.Now.ToString("dd/MM/yyyy");
            cep.Hora = DateTime.Now.ToString("HH:mm:ss");

            cepNeg.Salvar(cep);
        }
    }
}