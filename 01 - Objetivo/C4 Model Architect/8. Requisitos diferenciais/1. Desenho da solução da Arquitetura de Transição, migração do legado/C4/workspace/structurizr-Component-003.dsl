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

                // Componentes no Cadastro de Lançamentos
                apiLancamentosLegacy = component "API de Lançamentos" {
                    description "API para gerenciar os dados de lançamentos."
                    technology "Java Spring"
                }

                servicoValidacaoLancamentosLegacy = component "Serviço de Validação de Lançamentos" {
                    description "Valida os dados de lançamentos inseridos no sistema."
                    technology "Java"
                }
            }

            relatoriosFinanceirosLegacy = container "Relatórios Financeiros" {
                description "Gera relatórios financeiros no Sistema Legado."
                technology "MySQL"

                // Componentes no Relatórios Financeiros
                apiRelatoriosLegacy = component "API de Relatórios" {
                    description "API para gerar relatórios financeiros."
                    technology "Node.js"
                }

                servicoGeracaoRelatoriosLegacy = component "Serviço de Geração de Relatórios" {
                    description "Serviço que gera relatórios financeiros baseados nos dados."
                    technology "Python"
                }
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

                // Componentes no Cadastro de Lançamentos
                apiLancamentosNew = component "API de Lançamentos" {
                    description "API para gerenciar os dados de lançamentos no novo sistema."
                    technology "Node.js"
                }

                servicoValidacaoLancamentosNew = component "Serviço de Validação de Lançamentos" {
                    description "Valida os dados de lançamentos inseridos no novo sistema."
                    technology "Java"
                }
            }

            relatoriosFinanceirosNew = container "Relatórios Financeiros" {
                description "Gera relatórios financeiros no Novo Sistema."
                technology "PostgreSQL"

                // Componentes no Relatórios Financeiros
                apiRelatoriosNew = component "API de Relatórios" {
                    description "API para gerar relatórios financeiros no novo sistema."
                    technology "Node.js"
                }

                servicoGeracaoRelatoriosNew = component "Serviço de Geração de Relatórios" {
                    description "Serviço que gera relatórios financeiros no novo sistema."
                    technology "Python"
                }
            }
        }

        // Serviço de Sincronização
        syncService = softwareSystem "Serviço de Sincronização" {
            description "Serviço intermediário responsável pela sincronização de dados entre o sistema legado e o novo sistema, através de ETL ou APIs."
            tags "Sincronizacao"

            // Defina um container para o Serviço de Sincronização
            syncContainer = container "Sincronização de Dados" {
                description "Contém os componentes responsáveis por sincronizar os dados entre os sistemas."
                technology "ETL/API"

                // Componentes no Serviço de Sincronização
                servicoETL = component "Serviço de Sincronização ETL" {
                    description "Componente responsável pela sincronização de dados usando ETL."
                    technology "Python"
                }

                apiSincronizacao = component "API de Sincronização" {
                    description "API para sincronizar dados entre os sistemas."
                    technology "Node.js"
                }
            }
        }

        // Relacionamentos entre os componentes
        user -> apiLancamentosLegacy "Usa para registrar lançamentos no sistema legado"
        user -> apiRelatoriosLegacy "Usa para gerar relatórios no sistema legado"

        user -> apiLancamentosNew "Usa para registrar lançamentos no novo sistema"
        user -> apiRelatoriosNew "Usa para gerar relatórios no novo sistema"

        apiLancamentosLegacy -> apiSincronizacao "Envia dados de lançamentos para sincronização"
        apiRelatoriosLegacy -> apiSincronizacao "Envia dados de relatórios para sincronização"

        apiSincronizacao -> apiLancamentosNew "Sincroniza lançamentos"
        apiSincronizacao -> apiRelatoriosNew "Sincroniza relatórios"
    }

    views {
        // Diagrama de Componentes para o Sistema Legado
        component cadastroLancamentosLegacy {
            include *
            autolayout lr
            title "Diagrama de Componentes: Cadastro de Lançamentos (Sistema Legado)"
            description "Mostra os componentes dentro do container de Cadastro de Lançamentos no Sistema Legado."
        }

        component relatoriosFinanceirosLegacy {
            include *
            autolayout lr
            title "Diagrama de Componentes: Relatórios Financeiros (Sistema Legado)"
            description "Mostra os componentes dentro do container de Relatórios Financeiros no Sistema Legado."
        }

        // Diagrama de Componentes para o Novo Sistema
        component cadastroLancamentosNew {
            include *
            autolayout lr
            title "Diagrama de Componentes: Cadastro de Lançamentos (Novo Sistema)"
            description "Mostra os componentes dentro do container de Cadastro de Lançamentos no Novo Sistema."
        }

        component relatoriosFinanceirosNew {
            include *
            autolayout lr
            title "Diagrama de Componentes: Relatórios Financeiros (Novo Sistema)"
            description "Mostra os componentes dentro do container de Relatórios Financeiros no Novo Sistema."
        }

        // Diagrama de Componentes para o Serviço de Sincronização
        component syncContainer {
            include *
            autolayout lr
            title "Diagrama de Componentes: Serviço de Sincronização"
            description "Mostra os componentes dentro do Serviço de Sincronização entre os sistemas."
        }

        theme default
    }
}
