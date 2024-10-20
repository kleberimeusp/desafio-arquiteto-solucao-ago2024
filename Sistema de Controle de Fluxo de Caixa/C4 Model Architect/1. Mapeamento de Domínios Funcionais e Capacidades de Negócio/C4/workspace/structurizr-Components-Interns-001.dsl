workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        
        auditoria = softwareSystem "Sistema de Auditoria" "Recebe logs de auditoria para rastrear mudanças"
        banco_dados = softwareSystem "Banco de Dados" "Sistema de armazenamento seguro de transações"
        
        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações financeiras e consolida dados diários" {
            
            cadastro_transacoes = container "Cadastro de Transações" "Gerencia o registro e validação de transações" "Aplicação Web" {
                servico_validacao = component "Serviço de Validação de Transações" "Valida os dados das transações"
                servico_persistencia = component "Serviço de Persistência de Transações" "Persiste as transações no banco de dados"
                servico_auditoria = component "Serviço de Auditoria" "Envia logs para o sistema de auditoria"
            }

            consolidado_diario = container "Consolidado Diário" "Gera relatórios consolidados das transações" "Aplicação Web" {
                servico_consolidacao = component "Serviço de Consolidação" "Consolida as transações diárias e realiza cálculos"
                servico_relatorio = component "Serviço de Relatório" "Gera relatórios financeiros diários"
            }
        }

        user -> servico_validacao "Envia transações para validação"
        servico_validacao -> servico_persistencia "Valida e persiste transações"
        servico_persistencia -> banco_dados "Salva transações no banco de dados"
        servico_auditoria -> auditoria "Envia logs de auditoria"
        
        servico_consolidacao -> servico_relatorio "Gera relatórios consolidados"
        servico_relatorio -> user "Exibe relatórios consolidados"
        servico_consolidacao -> banco_dados "Consulta transações no banco de dados para consolidação"
    }

    views {

        container sys_fluxo_caixa {
            include *
            autolayout lr
            title "Diagrama de Componentes Internos - Sistema de Controle de Fluxo de Caixa"
        }

        component cadastro_transacoes {
            include *
            autolayout lr
            title "Componentes Internos - Cadastro de Transações"
        }

        component consolidado_diario {
            include *
            autolayout lr
            title "Componentes Internos - Consolidado Diário"
        }

        theme default
    }

}
