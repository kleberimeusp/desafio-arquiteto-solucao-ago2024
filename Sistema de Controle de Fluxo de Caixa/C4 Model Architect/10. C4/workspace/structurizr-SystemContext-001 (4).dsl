workspace {

    model {
        user = person "Usuários Finais" {
            description "Usuários que interagem com o sistema de controle de fluxo de caixa."
        }

        frontDoor = softwareSystem "Azure Front Door" {
            description "Serviço de balanceamento de carga e entrega de tráfego."
        }

        appFrontend = softwareSystem "Azure App Service (Frontend)" {
            description "Frontend hospedado no Azure para React Native"
        }

        appBackend = softwareSystem "Azure App Service (Backend)" {
            description "API Backend hospedada no Azure (Node.js)"
        }

        user -> frontDoor "Acessa"
        frontDoor -> appFrontend "Direciona requisições para"
        frontDoor -> appBackend "Direciona requisições para"
    }

    views {
        systemContext frontDoor {
            include user
            include appFrontend
            include appBackend
            autolayout lr
            title "Diagrama de Contexto - Aplicação de Controle de Fluxo de Caixa"
        }
        theme default
    }
}
