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

        // Relacionamentos
        user -> apiLancamentosLegacy "Usa para registrar lançamentos no sistema legado"
        user -> apiRelatoriosLegacy "Usa para gerar relatórios no sistema legado"

        user -> apiLancamentosNew "Usa para registrar lançamentos no novo sistema"
        user -> apiRelatoriosNew "Usa para gerar relatórios no novo sistema"

        // Relacionamentos do Sistema Legado
        apiLancamentosLegacy -> servicoValidacaoLancamentosLegacy "Valida lançamentos no sistema legado"
        apiLancamentosLegacy -> apiSincronizacao "Envia dados de lançamentos para sincronização"
        apiRelatoriosLegacy -> apiSincronizacao "Envia dados de relatórios para sincronização"

        // Relacionamentos do Novo Sistema
        apiLancamentosNew -> servicoValidacaoLancamentosNew "Valida lançamentos no novo sistema"
        apiSincronizacao -> apiLancamentosNew "Sincroniza lançamentos"
        apiSincronizacao -> apiRelatoriosNew "Sincroniza relatórios"
    }

    views {
        // Diagrama Dinâmico: Processo de Sincronização de Lançamentos
        dynamic syncContainer {
            title "Diagrama Dinâmico: Processo de Sincronização de Lançamentos"
            description "Este diagrama mostra como o usuário faz o registro de lançamentos no sistema legado e como esse lançamento é sincronizado com o novo sistema."

            // O usuário inicia o processo enviando dados para o sistema legado
            user -> apiLancamentosLegacy "Registra lançamentos no sistema legado"

            // O sistema legado valida os dados
            apiLancamentosLegacy -> servicoValidacaoLancamentosLegacy "Valida lançamentos no sistema legado"

            // Após a validação, o sistema legado envia os dados para a API de sincronização
            apiLancamentosLegacy -> apiSincronizacao "Envia dados de lançamentos para sincronização"

            // A API de sincronização transfere os dados para o novo sistema
            apiSincronizacao -> apiLancamentosNew "Sincroniza lançamentos com o novo sistema"

            // O novo sistema valida os dados sincronizados
            apiLancamentosNew -> servicoValidacaoLancamentosNew "Valida lançamentos no novo sistema"
        }

        theme default
    }
}
