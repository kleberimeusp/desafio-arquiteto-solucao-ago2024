workspace {

    model {
        user = person "Comerciante" "Usuário que realiza lançamentos e consulta o saldo diário"
        
        sys_auditoria = softwareSystem "Sistema de Auditoria" "Recebe logs de auditoria das transações"
        
        sys_fluxo_caixa = softwareSystem "Sistema de Controle de Fluxo de Caixa" "Gerencia transações financeiras e consolida dados diários"

        user -> sys_fluxo_caixa "Realiza lançamentos e consulta relatórios financeiros"
        sys_fluxo_caixa -> sys_auditoria "Envia logs de auditoria"
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
