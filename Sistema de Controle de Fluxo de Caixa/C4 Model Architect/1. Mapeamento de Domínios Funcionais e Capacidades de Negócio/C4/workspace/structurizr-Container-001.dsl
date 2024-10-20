workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        
        sys_auditoria = softwareSystem "Sistema de Auditoria" "Recebe logs de auditoria das transações"
        
        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações financeiras e consolida dados diários" {
            
            con_transacoes = container "Cadastro de Transações" "Gerencia o registro, validação e persistência de transações financeiras" "Aplicação Web"
            con_consolidado = container "Consolidado Diário" "Gera relatórios consolidados das transações e valida a consistência dos dados" "Aplicação Web"
            con_banco_dados = container "Banco de Dados" "Armazena as transações financeiras de forma durável e segura" "Banco de Dados Relacional"
        }

        user -> con_transacoes "Cadastra novas transações (vendas, compras, etc.)"
        user -> con_consolidado "Consulta saldo diário e relatórios financeiros"

        con_transacoes -> con_banco_dados "Persiste transações financeiras"
        con_consolidado -> con_banco_dados "Recupera transações para consolidação diária"

        con_transacoes -> sys_auditoria "Envia logs de auditoria"
    }

    views {
        container sys_fluxo_caixa {
            include *
            autolayout lr
            title "Diagrama de Contêineres - Sistema de Controle de Fluxo de Caixa"
        }

        theme default
    }

}
