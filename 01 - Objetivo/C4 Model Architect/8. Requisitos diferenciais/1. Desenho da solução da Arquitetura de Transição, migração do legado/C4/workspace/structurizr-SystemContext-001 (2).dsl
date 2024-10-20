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
        }

        // Novo Sistema (em desenvolvimento)
        newSystem = softwareSystem "Novo Sistema" {
            description "O novo sistema que está sendo introduzido, utilizando PostgreSQL como base de dados."
            tags "NovoSistema"
        }

        // Serviço de Sincronização
        syncService = softwareSystem "Serviço de Sincronização" {
            description "Serviço intermediário responsável pela sincronização de dados entre o sistema legado e o novo sistema, através de ETL ou APIs."
            tags "Sincronizacao"
        }

        // Relacionamentos entre os componentes
        user -> legacySystem "Acessa para criar e visualizar relatórios"
        user -> newSystem "Acessa para criar e visualizar relatórios (gradualmente)"
        legacySystem -> syncService "Envia dados para sincronização"
        newSystem -> syncService "Recebe dados sincronizados"
    }

    views {
        systemContext legacySystem {
            include *
            autolayout lr
            title "Diagrama de Contexto: Migração de Sistema Legado para Novo Sistema"
            description "Este diagrama mostra a interação entre o sistema legado, o novo sistema e o serviço de sincronização de dados durante a migração."
        }

        theme default
    }
}
