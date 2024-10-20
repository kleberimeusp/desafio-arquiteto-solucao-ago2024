workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        
        auditoria = softwareSystem "Sistema de Auditoria" "Recebe logs de auditoria"
        banco_dados = softwareSystem "Banco de Dados" "Armazena transações de forma durável"

        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações financeiras e consolida dados diários" {
            
            cadastro_transacoes = container "Cadastro de Transações" "Gerencia o registro e validação de transações" "Aplicação Web"
            consolidado_diario = container "Consolidado Diário" "Gera relatórios consolidados das transações" "Aplicação Web"
            con_banco_dados = container "Banco de Dados" "Armazena as transações financeiras de forma durável e segura" "Banco de Dados Relacional"
        }

        user -> cadastro_transacoes "Cadastra novas transações"
        user -> consolidado_diario "Consulta relatórios financeiros"

        cadastro_transacoes -> con_banco_dados "Salva transações financeiras"
        consolidado_diario -> con_banco_dados "Recupera transações para consolidação diária"
        cadastro_transacoes -> auditoria "Envia logs de auditoria"
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