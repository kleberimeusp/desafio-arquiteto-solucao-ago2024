# Monitoramento e Observabilidade em Migração de Sistema Legado

Monitoramento e observabilidade são componentes críticos para garantir o bom funcionamento e a saúde de sistemas em produção, especialmente durante e após uma migração de sistemas legados. Eles ajudam a detectar problemas, otimizar a performance e garantir que a migração ocorra de forma segura e eficaz.

## Diferença entre Monitoramento e Observabilidade

### Monitoramento:
- Refere-se ao acompanhamento de métricas e logs pré-definidos que informam sobre o estado do sistema.
- Identifica problemas conhecidos através de alarmes, verificações periódicas e métricas como uso de CPU, memória, tempo de resposta, disponibilidade, etc.
- **Exemplo**: "O servidor está online?", "O uso da CPU está abaixo de 80%?"

### Observabilidade:
- Vai além do monitoramento, sendo a capacidade de entender o que está acontecendo dentro de um sistema com base nas suas saídas (logs, métricas e traces).
- Permite identificar e diagnosticar problemas desconhecidos, coletando informações detalhadas sobre o comportamento do sistema.
- Geralmente é definida em termos de três pilares: logs, métricas e traces.

---

## Os Três Pilares da Observabilidade

### 1. Métricas:
Valores numéricos coletados periodicamente que informam sobre a performance do sistema.
- **Exemplos**: Uso de CPU, tempo de resposta de APIs, número de requisições por segundo.
- **Ferramentas**:
  - **Prometheus**: Solução open-source para séries temporais de métricas.
  - **Datadog**: Solução comercial para monitoramento e análise de métricas.
  - **Grafana**: Ferramenta de visualização de métricas, geralmente usada com Prometheus.

### 2. Logs:
Registros de eventos e atividades gerados por aplicações, serviços e infraestrutura. Útil para entender o que aconteceu no sistema em um determinado ponto.
- **Exemplo**: Mensagens de erro, falhas de banco de dados.
- **Ferramentas**:
  - **ELK Stack (Elasticsearch, Logstash, Kibana)**: Para coleta, processamento e visualização de logs.
  - **Graylog**: Ferramenta popular para gerenciamento de logs.
  - **Splunk**: Solução comercial para análise de logs.

### 3. Traces:
Rastreamento do caminho de uma requisição em sistemas distribuídos, mostrando todas as interações de uma requisição entre diferentes serviços.
- **Ferramentas**:
  - **Jaeger**: Open-source para tracing distribuído.
  - **OpenTelemetry**: Coleta de traces, métricas e logs.
  - **Zipkin**: Solução para tracing de sistemas distribuídos.

---

## Boas Práticas para Implementar Monitoramento e Observabilidade

1. **Escolher as Ferramentas Adequadas**:
   - Ferramentas Open-source: Prometheus, Grafana, ELK Stack, Jaeger.
   - Soluções Comerciais: Datadog, Splunk, New Relic, Dynatrace.

2. **Configurar Alertas Inteligentes**:
   - Definir alertas com base em limiares para métricas do sistema (uso de CPU, memória) e eventos de aplicação.
   - Alertas preditivos para detectar padrões que podem levar a falhas.

3. **Dashboard Centralizado**:
   - Crie dashboards centralizados para visualizar métricas e logs em tempo real.
   - Ferramentas como Grafana e Kibana são ideais para visualização.

4. **Logs Estruturados**:
   - Utilize logs estruturados (JSON, por exemplo) para permitir buscas rápidas e detalhadas.

5. **Correlação entre Métricas e Logs**:
   - Correlacionar eventos de logs com métricas para uma visão mais ampla do problema.

6. **Tracing para Microsserviços**:
   - Implementar tracing para entender o fluxo de requisições entre serviços distribuídos.

7. **Métricas de Aplicação e Negócio**:
   - Monitore métricas relacionadas ao negócio, como número de transações, tempo de resposta de requisições.

---

## Implementação de Monitoramento em um Ambiente de Migração

### 1. Monitoramento Contínuo:
Monitore tanto o sistema legado quanto o novo sistema simultaneamente, para garantir uma transição suave.

### 2. Monitoramento do Serviço de Sincronização:
Monitore o serviço que mantém os dados sincronizados entre os sistemas legado e novo para evitar inconsistências.

### 3. Métricas de Performance:
Durante a migração de dados, monitore o desempenho de banco de dados, tempo de resposta e consumo de recursos.

### 4. Logs de Erro e Auditoria:
Garanta que erros e eventos críticos sejam logados durante a migração. Implemente logs de auditoria para garantir que nenhuma transação seja perdida.

### 5. Testes de Carga e Stress:
Realize testes de carga e stress no novo sistema antes de colocar em produção.

---

## Exemplo de Ferramentas para um Ambiente de Migração

- **Prometheus + Grafana**: Coleta e visualização de métricas de servidores e aplicações.
- **ELK Stack (Elasticsearch, Logstash, Kibana)**: Coleta e análise de logs.
- **Jaeger + OpenTelemetry**: Implementação de tracing distribuído.
- **Datadog ou New Relic**: Soluções comerciais integradas para métricas, logs e tracing.

---

## Custos de Implementação de Monitoramento e Observabilidade

### Open-source:
- **Prometheus + Grafana**: Gratuito (custo de infraestrutura).
- **ELK Stack**: Gratuito, com custo de servidores.
- **Jaeger/OpenTelemetry**: Gratuito, sem custos diretos além da infraestrutura.

### Soluções Comerciais:
- **Datadog**: US$ 15 a US$ 30/mês por host.
- **New Relic**: Aproximadamente US$ 99/mês por host.
- **Splunk**: Custo baseado no volume de dados indexados, cerca de US$ 150 a US$ 200 por GB/mês.

Essas soluções comerciais oferecem integração simplificada e suporte contínuo, útil em cenários onde a eficiência operacional é crítica.

---

## Conclusão

Monitoramento e observabilidade são essenciais em ambientes de migração para garantir que os sistemas legados e os novos sistemas funcionem corretamente. A escolha das ferramentas certas, a implementação de boas práticas e a configuração de alertas proativos são cruciais para garantir uma transição tranquila e sem falhas.

