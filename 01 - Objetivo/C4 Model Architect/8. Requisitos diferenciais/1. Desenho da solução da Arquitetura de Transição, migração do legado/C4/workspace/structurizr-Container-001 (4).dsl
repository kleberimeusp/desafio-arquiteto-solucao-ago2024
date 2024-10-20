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
            description "Serviço intermediário responsável pela sincronização de dados entre o sistema legado e o novo sistema, através de ETL ou APIs."
            tags "Sincronizacao"
        }

        // Relacionamentos entre os containers
        user -> cadastroLancamentosLegacy "Utiliza para registrar lançamentos"
        user -> relatoriosFinanceirosLegacy "Utiliza para gerar relatórios"
        
        user -> cadastroLancamentosNew "Utiliza para registrar lançamentos"
        user -> relatoriosFinanceirosNew "Utiliza para gerar relatórios"

        cadastroLancamentosLegacy -> syncService "Envia dados de lançamentos"
        relatoriosFinanceirosLegacy -> syncService "Envia dados de relatórios"

        syncService -> cadastroLancamentosNew "Sincroniza lançamentos"
        syncService -> relatoriosFinanceirosNew "Sincroniza relatórios"
    }

    views {
        // Diagrama de Containers
        container legacySystem {
            include *
            autolayout lr
            title "Diagrama de Containers: Sistema Legado e Novo Sistema"
            description "Este diagrama mostra os containers (Cadastro de Lançamentos e Relatórios Financeiros) no sistema legado e no novo sistema, além da interação com o serviço de sincronização."
        }

        theme default
    }
}
