workspace {

    model {
        user = person "Usuários Finais"
        frontend = softwareSystem "Azure App Service (Frontend)" {
            description "Frontend React Native hospedado no Azure"
        }
        backend = softwareSystem "Azure App Service (Backend)" {
            description "Backend em Node.js hospedado no Azure"
        }

        sqlDb = softwareSystem "Azure SQL Database / PostgreSQL"
        eventHub = softwareSystem "Azure Event Hub / Service Bus"
        storage = softwareSystem "Azure Blob Storage"
        monitor = softwareSystem "Azure Monitor / Application Insights"

        user -> frontend "Interage com"
        frontend -> backend "Comunica com"
        backend -> sqlDb "Acessa o banco de dados"
        backend -> eventHub "Envia e recebe mensagens"
        backend -> storage "Armazena arquivos"
        backend -> monitor "Monitora a aplicação"

    }

    views {
        systemContext frontend {
            include *
            autolayout lr
            title "Diagrama de Contexto - Sistema de Controle de Fluxo de Caixa"
        }

        theme default
    }

}
