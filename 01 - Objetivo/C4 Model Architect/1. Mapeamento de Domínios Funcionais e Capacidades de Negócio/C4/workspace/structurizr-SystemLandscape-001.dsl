workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        auditoria = softwareSystem "Sistema de Auditoria" "Recebe logs de auditoria para rastrear mudanças"
        banco_dados = softwareSystem "Banco de Dados" "Sistema de armazenamento seguro de transações"
        
        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações financeiras e consolida dados diários" {
            cadastro_transacoes = container "Cadastro de Transações" "Gerencia o registro e validação de transações" "Aplicação Web"
            consolidado_diario = container "Consolidado Diário" "Gera relatórios consolidados das transações" "Aplicação Web"
        }

        user -> sys_fluxo_caixa "Realiza lançamentos e consulta relatórios"
        sys_fluxo_caixa -> auditoria "Envia logs de auditoria"
        sys_fluxo_caixa -> banco_dados "Persiste e consulta transações"

        cadastro_transacoes -> banco_dados "Salva transações financeiras"
        consolidado_diario -> banco_dados "Consulta transações para consolidar dados"
        cadastro_transacoes -> auditoria "Envia logs de auditoria"
    }

    views {
        systemLandscape {
            include *
            autolayout lr
            title "System Landscape - Sistema de Controle de Fluxo de Caixa"
        }

        theme default
    }

}
