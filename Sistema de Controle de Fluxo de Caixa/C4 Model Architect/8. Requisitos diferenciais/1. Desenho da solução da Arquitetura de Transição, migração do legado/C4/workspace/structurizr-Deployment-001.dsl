workspace {

    model {
        // Atores externos que interagem com o sistema
        user = person "Usuário" {
            description "Usuário que acessa o sistema para registros financeiros e relatórios."
        }

        // Sistema Legado (em operação)
        legacySystem = softwareSystem "Sistema Legado" {
            description "O sistema legado que utiliza MySQL ou SQL para gerenciar dados de lançamentos e relatórios financeiros."
            tags "SistemaExistente"

            // Containers no Sistema Legado
            cadastroLancamentosLegacy = container "Cadastro de Lançamentos" {
                description "Gerencia o cadastro de lançamentos no Sistema Legado."
                technology "MySQL"
            }

            relatoriosFinanceirosLegacy = container "Relatórios Financeiros" {
                description "Gera relatórios financeiros no Sistema Legado."
                technology "MySQL"
            }
        }

        // Novo Sistema (em desenvolvimento)
        newSystem = softwareSystem "Novo Sistema" {
            description "O novo sistema que está sendo introduzido, utilizando PostgreSQL como base de dados."
            tags "NovoSistema"

            // Containers no Novo Sistema
            cadastroLancamentosNew = container "Cadastro de Lançamentos" {
                description "Gerencia o cadastro de lançamentos no Novo Sistema."
                technology "PostgreSQL"
            }

            relatoriosFinanceirosNew = container "Relatórios Financeiros" {
                description "Gera relatórios financeiros no Novo Sistema."
                technology "PostgreSQL"
            }
        }

        // Serviço de Sincronização
        syncService = softwareSystem "Serviço de Sincronização" {
            description "Serviço intermediário responsável pela sincronização de dados entre o sistema legado e o novo sistema."
            tags "Sincronizacao"

            // Containers no Serviço de Sincronização
            syncContainer = container "Sincronização de Dados" {
                description "Responsável por sincronizar os dados entre os sistemas."
                technology "ETL/API"
            }
        }

        // Infraestrutura de Implantação
        deploymentEnvironment "Produção" {
            // Nó para o Sistema Legado
            legacyServer = deploymentNode "Servidor Legado" {
                description "Servidor físico rodando o Sistema Legado"
                technology "Linux, Apache Tomcat 9.x"

                // Containers implantados no servidor legado
                containerInstance cadastroLancamentosLegacy
                containerInstance relatoriosFinanceirosLegacy
            }

            // Nó para o Novo Sistema
            newSystemServer = deploymentNode "Servidor Novo Sistema" {
                description "Servidor físico rodando o Novo Sistema"
                technology "Linux, Apache Tomcat 10.x"

                // Containers implantados no servidor do novo sistema
                containerInstance cadastroLancamentosNew
                containerInstance relatoriosFinanceirosNew
            }

            // Nó para o Serviço de Sincronização
            syncServer = deploymentNode "Servidor de Sincronização" {
                description "Servidor responsável pela sincronização entre o Sistema Legado e o Novo Sistema"
                technology "Linux, Python"

                // Container implantado no servidor de sincronização
                containerInstance syncContainer
            }
        }
    }

    views {
        // Diagrama de Implantação (Deployment Diagram)
        deployment * "Produção" {
            include *
            autolayout lr
            title "Diagrama de Implantação: Sistema Legado, Novo Sistema e Sincronização"
            description "Este diagrama mostra como o Sistema Legado, o Novo Sistema e o Serviço de Sincronização estão implantados nos servidores."
        }

        theme default
    }
}
