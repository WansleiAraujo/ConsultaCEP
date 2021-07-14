using System;
using System.Collections.Generic;
using System.Data;
using MySql.Data.MySqlClient;
using Formulario.VO;

namespace Formulario.Dados
{
    public class CepDados : BaseDados<LOG>
    {
        public override void Atualizar(LOG entidade)
        {
            throw new NotImplementedException();
        }

        public override void Excluir(LOG entidade)
        {
            throw new NotImplementedException();
        }

        public override LOG Recuperar(LOG entidade)
        {
            throw new NotImplementedException();
        }

        public override void Salvar(LOG entidade)
        {
            try
            {
                MySqlCommand cmd = new MySqlCommand();
                AdicionarParametro(cmd, "@cep", MySqlDbType.VarChar, entidade.Cep);
                AdicionarParametro(cmd, "@data", MySqlDbType.VarChar, entidade.Data);
                AdicionarParametro(cmd, "@hora", MySqlDbType.VarChar, entidade.Hora);

                ExecutarSQL(cmd, "INSERT INTO LOG(cep, data, hora) VALUES(@cep, @data, @hora)", CommandType.Text);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public override List<LOG> Todos()
        {
            try
            {
                List<LOG> retorno = new List<LOG>();

                //Utiliza o using para fechar o reader e a conecao
                using (MySqlDataReader reader = ExecutaDataReader("SELECT * FROM LOG ORDER BY data DESC", CommandType.Text))
                {
                    while (reader.Read())
                    {
                        LOG status = new LOG
                        {
                            IdLOG = Convert.ToInt32(reader["idLOG"]),
                            Cep = reader["cep"].ToString(),
                            Data = reader["data"].ToString(),
                            Hora = reader["hora"].ToString()
                        };

                        retorno.Add(status);
                    }
                }
                return retorno;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
