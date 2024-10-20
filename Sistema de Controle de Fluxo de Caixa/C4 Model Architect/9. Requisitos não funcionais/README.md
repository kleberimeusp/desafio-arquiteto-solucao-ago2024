# Requisitos Não Funcionais

Os requisitos não funcionais definem como o sistema deve operar, cobrindo aspectos como desempenho, segurança, confiabilidade e outros que garantem a qualidade e o comportamento desejado do sistema. Abaixo estão os principais tipos de requisitos não funcionais que devem ser considerados ao migrar um sistema legado ou projetar um novo sistema.

## 1. Desempenho (Performance)

- **Tempo de Resposta**: O sistema deve responder às requisições em um tempo aceitável (ex: APIs devem responder em até 200ms para consultas simples).
- **Largura de Banda**: A quantidade de dados que o sistema pode processar por segundo (ex: o sistema deve processar ao menos 1.000 transações por minuto).
- **Escalabilidade**:
  - **Horizontal**: Capacidade de adicionar mais servidores para lidar com o aumento de tráfego.
  - **Vertical**: Capacidade de aumentar os recursos (CPU, memória) dos servidores existentes.
- **Capacidade de Carga**: Suporte a um número máximo de usuários simultâneos ou requisições concorrentes (ex: o sistema deve suportar 10.000 usuários simultâneos).

## 2. Segurança

- **Autenticação**: Garantir que apenas usuários autenticados possam acessar as funcionalidades (ex: OAuth 2.0).
- **Autorização**: Controle de permissões com base em papéis (ex: RBAC).
- **Criptografia**:
  - **Em Trânsito**: Criptografia de todas as comunicações usando TLS 1.2 ou superior.
  - **Em Repouso**: Dados sensíveis devem ser criptografados quando armazenados.
- **Auditoria**: Registro de ações críticas de usuários e administradores para fins de auditoria.
- **Proteção contra Ataques**: Implementação de proteções contra ataques como SQL Injection, XSS, CSRF e DDoS.

## 3. Confiabilidade e Disponibilidade

- **Disponibilidade**: O sistema deve estar disponível pelo maior tempo possível (ex: 99,9% de disponibilidade anual).
- **Tolerância a Falhas**: O sistema deve continuar operando em caso de falhas de hardware ou software.
- **Recuperação de Desastres**:
  - **RTO (Recovery Time Objective)**: Tempo máximo para recuperação após uma falha.
  - **RPO (Recovery Point Objective)**: Ponto no tempo para o qual os dados devem ser recuperados (ex: até 15 minutos de dados podem ser perdidos).
- **Alta Disponibilidade (HA)**: Implementação de clusters ou failover para garantir operação contínua.

## 4. Usabilidade

- **Facilidade de Uso**: O sistema deve ser intuitivo e fácil de usar.
- **Acessibilidade**: Conformidade com padrões de acessibilidade (ex: WCAG 2.1).
- **Documentação**: Documentação clara e detalhada para usuários e administradores.
- **Tempo de Aprendizado**: Novos usuários devem ser capazes de realizar tarefas básicas em até 2 horas.

## 5. Manutenibilidade

- **Modularidade**: O sistema deve ser modular, facilitando atualizações e manutenções.
- **Facilidade de Atualização**: Aplicação de patches e atualizações sem interromper o serviço.
- **Testabilidade**: Facilidade de testar o sistema, com cobertura automatizada para evitar a introdução de falhas.
- **Documentação Técnica**: Manter a documentação do código e arquitetura atualizada.

## 6. Escalabilidade

- **Escalabilidade Horizontal e Vertical**: Suporte à escalabilidade horizontal e vertical.
- **Elasticidade**: Capacidade de escalar automaticamente conforme a demanda.
- **Tolerância a Picos de Uso**: Suporte a picos de tráfego sem degradação significativa (ex: suportar 10x o tráfego médio durante eventos).

## 7. Portabilidade

- **Independência de Plataforma**: O sistema deve rodar em diferentes plataformas e sistemas operacionais (ex: Linux e Windows).
- **Migração de Dados**: Suporte à migração de dados entre diferentes bancos de dados ou provedores.
- **Suporte a Múltiplos Dispositivos**: O sistema deve ser acessível em desktops, tablets e smartphones.

## 8. Interoperabilidade

- **Integração com Sistemas Externos**: Capacidade de integrar-se com outros sistemas de forma eficiente e segura.
- **Padrões de Comunicação**: Utilizar padrões como REST, SOAP, gRPC para garantir interoperabilidade.
- **Formatos de Dados**: Suporte à troca de dados em formatos comuns (ex: JSON, XML, CSV).

## 9. Compliance (Conformidade)

- **Conformidade com Normas e Regulamentos**: O sistema deve seguir normas aplicáveis, como LGPD, GDPR, PCI-DSS.
- **Proteção de Dados Pessoais**: Proteção de dados pessoais conforme regulamentações de privacidade.
- **Auditoria e Controle**: Mecanismos de auditoria que permitam rastrear ações de usuários e administradores.

## 10. Eficiência Energética

- **Uso Eficiente de Recursos**: O sistema deve ser eficiente no uso de CPU, memória e energia.
- **Sustentabilidade**: Utilização de infraestrutura de baixo consumo energético, com foco na sustentabilidade.

## 11. Latência e Throughput

- **Latência**: Garantia de baixa latência em sistemas críticos (ex: sistemas financeiros ou de comunicação em tempo real).
- **Throughput**: Capacidade de processar um grande número de transações por segundo conforme as necessidades do negócio.

## 12. Compatibilidade

- **Compatibilidade com Sistemas Legados**: O sistema deve ser compatível com sistemas legados para permitir uma migração suave.
- **Compatibilidade com Novas Tecnologias**: Flexibilidade para integrar novas tecnologias sem grandes modificações no sistema central.

---

Esses requisitos não funcionais são essenciais para garantir a qualidade, a segurança e o desempenho do sistema, tanto durante a migração de um sistema legado quanto no desenvolvimento de um novo sistema.
