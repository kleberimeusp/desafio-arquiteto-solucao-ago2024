workspace {

    model {
        user = person "Usuários Finais" {
            description "Usuários que interagem com o sistema de controle de fluxo de caixa."
        }

        system = softwareSystem "Sistema de Controle de Fluxo de Caixa" {
            description "Sistema principal para transações financeiras."

            frontDoor = container "Azure Front Door" {
                description "Serviço de balanceamento de carga."
            }

            appFrontend = container "Frontend" {
                description "Aplicação React Native hospedada no Azure App Service"
                technology "React Native"
            }

            appBackend = container "Backend API" {
                description "API de controle de transações financeiras"
                technology "Node.js"
            }

            sqlDb = container "Azure SQL Database" {
                description "Banco de dados relacional para armazenar transações financeiras"
                technology "PostgreSQL"
            }

            eventHub = container "Azure Event Hub" {
                description "Serviço de mensageria para logs e auditoria"
                technology "Kafka"
            }

            blobStorage = container "Azure Blob Storage" {
                description "Serviço de armazenamento de arquivos e relatórios"
                technology "Blob Storage"
            }

            monitor = container "Azure Monitor / Application Insights" {
                description "Monitoramento e logs da aplicação"
            }

            # Definindo interações
            user -> frontDoor "Acessa"
            frontDoor -> appFrontend "Redireciona requisições para"
            frontDoor -> appBackend "Redireciona requisições para"
            appFrontend -> appBackend "Chama API de Backend"
            appBackend -> sqlDb "Grava e lê transações"
            appBackend -> eventHub "Envia logs"
            appBackend -> blobStorage "Armazena relatórios"
            appBackend -> monitor "Envia métricas de monitoramento"
        }
    }

    views {
        container system {
            include *
            autolayout lr
            title "Diagrama de Contêineres - Sistema de Controle de Fluxo de Caixa"
        }
        theme default
    }
}
