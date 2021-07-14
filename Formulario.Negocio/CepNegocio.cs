using System;
using System.Collections.Generic;
using Formulario.VO;
using Formulario.Dados;

namespace Formulario.Negocio
{
    public class CepNegocio : NegocioBase<LOG>
    {
        private CepDados Dados = new CepDados();

        public override void Salvar(LOG entidade)
        {
            try
            {
                Dados.Salvar(entidade);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public override void Excluir(LOG entidade)
        {
            throw new NotImplementedException();
        }

        public override void Atualizar(LOG entidade)
        {
            throw new NotImplementedException();
        }

        public override LOG Recuperar(LOG entidade)
        {
            throw new NotImplementedException();
        }

        public override List<LOG> Todos()
        {
            try
            {
                return Dados.Todos();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
