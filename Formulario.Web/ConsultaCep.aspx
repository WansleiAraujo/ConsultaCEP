<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaCep.aspx.cs" Inherits="Formulario.Web.ConsultaCep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CEP Consultados</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="Style/lib/bootstrap/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Style/css/site.css" />
    <script type="text/javascript">
        function Cep(evento, objeto) {
            var keypress = (window.event) ? event.keyCode : evento.which;
            campo = eval(objeto);
            if (campo.value == '00.000-000') {
                campo.value = ""
            }

            caracteres = '0123456789';

            separacao110 = '.';
            separacao120 = '-';

            conjunto0001 = 2;
            conjunto0002 = 6;
            conjunto0003 = 10;

            if ((caracteres.search(String.fromCharCode(keypress)) != -1) && campo.value.length < (10)) {
                if (campo.value.length == conjunto0001)
                    campo.value = campo.value + separacao110;
                else if (campo.value.length == conjunto0002)
                    campo.value = campo.value + separacao120;
                else if (campo.value.length == conjunto0003)
                    campo.value = campo.value;
            }
            else
                event.returnValue = false;
        }  
    </script>
</head>
<body>
    <header>
        <nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-light bg-white border-bottom box-shadow mb-3">
            <div class="container">
                <a class="navbar-brand text-info" asp-area="Default.aspx" asp-page="Default.aspx" href="Default.aspx">LOCALIZAR CEP</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target=".navbar-collapse" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse d-sm-inline-flex flex-sm-row-reverse">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item">
                            <a class="nav-link text-info" asp-area="" asp-page="ConsultaCep.aspx" href="ConsultaCep.aspx">Consulta</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-info" asp-area="" asp-page="Consultados.aspx" href="Consultados.aspx">Consultados</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link text-dark" asp-area="" asp-page="Default.aspx" href="Default.aspx">Sair</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <form id="form1" runat="server">
        <asp:Panel ID="PanelCliente" runat="server">
            <div class="container" id="cliente">
                <main role="main" class="pb-3">
                    <div class="container">
                        <div class="row">
                            <div class="col-12 text-center my-2">
                                <h2 class="display-6">Localizar Endereço</h2>
                                <i class="fas-clipboard-list-check"></i>
                            </div>
                        </div>
                    </div>
                    <div class="container my-5">
                        <div class="form-group">
                            <div class="form-group" style="float: left; margin-right: 10px">
                                <asp:TextBox ID="txtCep" runat="server" class="form-control" type="cliente" placeholder="Informe o CEP do cliente" onkeypress="Cep(event, this)" MaxLength="10" TabIndex="4"></asp:TextBox>
                            </div>
                            <div class="form-group" style="float: left; margin-right: 10px">
                                <asp:Button ID="btnPesquisarCep" runat="server" Text="Pesquisar" class="btn btn-primary" OnClick="btnPesquisarCep_Click" Visible="True" TabIndex="5"></asp:Button>
                            </div>
                            <div class="form-group" style="float: left">
                                <asp:Label ID="lblValidaCep" runat="server" Text="" class="form-text text-muted"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class="form-group">
                        </div>
                    </div>
                    
                    <div class="container my-5">
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Rua/Avenida: " class="text-info"></asp:Label>
                            <asp:Label ID="lblRua" runat="server" Text=""></asp:Label>                 
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label2" runat="server" Text="Bairro: " class="text-info"></asp:Label>
                            <asp:Label ID="lblBairro" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label3" runat="server" Text="Cidade: " class="text-info"></asp:Label>
                            <asp:Label ID="lblCidade" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                             <asp:Label ID="Label4" runat="server" Text="Estado: " class="text-info"></asp:Label>
                            <asp:Label ID="lblEstado" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label5" runat="server" Text="CEP: " class="text-info"></asp:Label>
                            <asp:Label ID="lblCep" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblValida" runat="server" Text="" class="form-text text-muted"></asp:Label>
                        <asp:Label ID="lblEnvioMsg" runat="server" Text="" class="form-text text-muted"></asp:Label>
                    </div>
                    <div class="form-group" style="float: left; margin-right: 10px">
                    </div>
                </main>
            </div>
        </asp:Panel>

        <footer class="border-top footer text-muted">
            <div class="container">
                &copy;
            <asp:Literal ID="lblAno" runat="server"></asp:Literal>
                <a href="http://www.wansleiaraujo.com">| Wanslei Araujo</a>
            </div>
        </footer>

    </form>
    <script src="Style/lib/jquery/dist/jquery.min.js"></script>
    <script src="Style/lib/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="Style/js/site.js" asp-append-version="true"></script>
</body>
</html>
