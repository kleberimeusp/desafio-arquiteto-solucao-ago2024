workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        
        auditoria = softwareSystem "Sistema de Auditoria"
        banco_dados = softwareSystem "Banco de Dados"
        
        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações e consolida dados" {
            
            cadastro_transacoes = container "Cadastro de Transações" "Gerencia o registro e validação" "Aplicação Web" {
                servico_validacao = component "Serviço de Validação de Transações" "Valida os dados"
                servico_persistencia = component "Serviço de Persistência" "Persiste no banco de dados"
                servico_auditoria = component "Serviço de Auditoria" "Envia logs"
            }

            consolidado_diario = container "Consolidado Diário" "Gera relatórios financeiros" "Aplicação Web" {
                servico_consolidacao = component "Serviço de Consolidação" "Consolida transações"
                servico_relatorio = component "Serviço de Relatório" "Gera relatórios"
            }
        }

        user -> servico_validacao "Envia transações"
        servico_validacao -> servico_persistencia "Valida e salva transações"
        servico_persistencia -> banco_dados "Salva no banco"
        servico_auditoria -> auditoria "Envia logs"

        servico_consolidacao -> servico_relatorio "Gera relatórios"
        servico_relatorio -> user "Exibe relatórios"
        servico_consolidacao -> banco_dados "Consulta transações"
    }

    views {
        component cadastro_transacoes {
            include *
            autolayout lr
            title "Componentes - Cadastro de Transações"
        }

        component consolidado_diario {
            include *
            autolayout lr
            title "Componentes - Consolidado Diário"
        }

        theme default
    }


}
