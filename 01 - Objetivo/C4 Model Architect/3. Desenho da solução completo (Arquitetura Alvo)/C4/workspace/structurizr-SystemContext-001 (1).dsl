workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        auditoria = softwareSystem "Sistema de Auditoria" "Recebe logs de auditoria para rastrear mudanças"
        banco_dados = softwareSystem "Banco de Dados" "Sistema de armazenamento seguro de transações"

        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações financeiras e consolida dados diários"

        user -> sys_fluxo_caixa "Realiza lançamentos e consulta relatórios financeiros"
        sys_fluxo_caixa -> auditoria "Envia logs de auditoria"
        sys_fluxo_caixa -> banco_dados "Persiste e consulta transações"
    }

    views {
        systemContext sys_fluxo_caixa {
            include *
            autolayout lr
            title "Diagrama de Contexto - Sistema de Controle de Fluxo de Caixa"
        }

        theme default
    }


}
