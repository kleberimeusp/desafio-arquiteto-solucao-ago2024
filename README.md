# Sistema de Controle de Fluxo de Caixa na Azure

- *(MODELO CORPORATIVO DE NORMAS DA ARQUITETURA DE REFERÊNCIA, ARQUITETURA DE INOVAÇÃO E ARQUITETURA DE LEGADOS).*
- *(APLICADO EM TODOS OS CLIENTES EM MODELO DE REUSO).* 
- *(MODELO DE README.MD QUE APLIQUEI EM CLIENTES INTERNACIONAIS NA AMERICA DO NORTE/EUROPA/INDIA/JAPÃO E AUSTRÁLIA).* 
- *(TRADUZIDO PARA ESSE TESTE AQUI EM PORTUGUÊS).*

---

## Índices

1. [Introdução](#1-introdução)
2. [Instalação](#https://github.com/kleberimeusp/desafio-arquiteto-solucao-ago2024/blob/main/Sistema%20de%20Controle%20de%20Fluxo%20de%20Caixa/C4%20Model%20Architect/1.%20Mapeamento%20de%20Dom%C3%ADnios%20Funcionais%20e%20Capacidades%20de%20Neg%C3%B3cio/README.md)
3. [Configuração](#3-configuração)
4. [Uso](#4-uso)
5. [Exemplos](#5-exemplos)
6. [API](#6-api)
7. [Testes](#7-testes)
8. [Contribuindo](#8-contribuindo)
9. [Licença](#9-licença)


## Descrição do Projeto

Este projeto visa implementar uma solução para o controle de fluxo de caixa com backend em **Node.js** e frontend em **React Native**, ambos hospedados na **Azure**. O sistema processa lançamentos financeiros (débitos e créditos) e gera relatórios consolidados diários. A solução utiliza os principais serviços da **Azure**, garantindo escalabilidade, alta disponibilidade e monitoramento.

## Arquitetura da Solução

### C1

![alt text](/Sistema%20de%20Controle%20de%20Fluxo%20de%20Caixa/C4%20Model%20Architect/0.%20default/10.%20C4/C1/structurizr-SystemContext-001%20(3).png)


![alt text](/Sistema%20de%20Controle%20de%20Fluxo%20de%20Caixa/C4%20Model%20Architect/0.%20default/10.%20C4/C1/structurizr-SystemContext-001%20(4).png)

### C2

![alt text](/Sistema%20de%20Controle%20de%20Fluxo%20de%20Caixa/C4%20Model%20Architect/0.%20default/10.%20C4/C2/structurizr-Container-001%20(5).png)

### Componentes Principais:

1. **Azure Front Door / Traffic Manager**:
   - **Função**: Balanceamento de carga global e entrega de tráfego.
   - **Objetivo**: Distribuir o tráfego de usuários entre o frontend e o backend, garantindo alta disponibilidade e resposta rápida.

2. **Azure App Service (Backend Node.js)**:
   - **Função**: API backend que gerencia o fluxo de lançamentos financeiros e relatórios consolidados.
   - **Escalabilidade**: Escala automaticamente com base na carga de trabalho.
   
3. **Azure App Service (Frontend React Native)**:
   - **Função**: Hospeda o frontend da aplicação React Native.
   - **Comunicação**: Interage com o backend para registrar transações e consultar relatórios.

4. **Azure SQL Database / PostgreSQL**:
   - **Função**: Banco de dados relacional que armazena as transações financeiras e relatórios diários.
   - **Disponibilidade**: Alta disponibilidade integrada com backups automáticos.

5. **Azure Event Hub / Service Bus**:
   - **Função**: Serviço de mensageria para processar logs de auditoria e enfileirar transações.
   - **Objetivo**: Garante processamento assíncrono e resiliência das operações.

6. **Azure Blob Storage / Azure Files**:
   - **Função**: Armazena arquivos estáticos, relatórios, logs de auditoria e outros dados.
   - **Escalabilidade**: Escala automaticamente com base nas necessidades de armazenamento.

7. **Azure Monitor + Application Insights**:
   - **Função**: Monitoramento e observabilidade do sistema.
   - **Objetivo**: Coleta dados de desempenho e métricas para garantir a saúde do sistema.

---

## Componentes e Interações

### Azure Front Door / Traffic Manager:
- **Balanceamento de carga**: Distribui o tráfego globalmente para o frontend e o backend, garantindo resposta rápida e alta disponibilidade.

### Azure App Service:
- **Backend Node.js**:
  - Processa transações financeiras e consolidação de dados diários.
  - Comunicação com Azure SQL Database e Azure Event Hub.
- **Frontend React Native**:
  - Interface para o usuário final.
  - Comunicação com a API Backend.

### Banco de Dados:
- **Azure SQL Database / PostgreSQL**:
  - Armazena os dados financeiros.
  - Fornece recuperação e backup automático.

### Mensageria:
- **Azure Event Hub / Service Bus**:
  - Utilizado para mensageria e processamento de eventos e logs de auditoria.

### Armazenamento:
- **Azure Blob Storage**:
  - Utilizado para armazenar relatórios, logs de auditoria e arquivos de mídia.

### Monitoramento:
- **Azure Monitor + Application Insights**:
  - Monitora métricas do sistema, incluindo tempos de resposta, uso de CPU, e logs de erros.

---

## Estimativa de Custos na Azure

Aqui está uma estimativa de custos aproximados com base nos serviços usados na arquitetura descrita:

### **Azure App Service (Backend e Frontend)**:
- **Custo estimado**: R$ 200 a R$ 1000/mês por instância (dependendo da capacidade de CPU e memória).

### **Azure SQL Database ou PostgreSQL**:
- **Custo estimado**: R$ 300 a R$ 1.500/mês, dependendo do tamanho da instância e volume de dados.

### **Azure Blob Storage ou Azure Files**:
- **Custo estimado**: R$ 0,10 a R$ 0,30 por GB armazenado/mês.

### **Azure Event Hub / Service Bus**:
- **Custo estimado**: R$ 200 a R$ 500/mês para tráfego moderado de eventos e mensagens.

### **Azure Front Door / Traffic Manager**:
- **Custo estimado**: R$ 150 a R$ 500/mês dependendo do volume de tráfego.

### **Azure Monitor + Application Insights**:
- **Custo estimado**: R$ 150 a R$ 500/mês, dependendo do volume de dados monitorados.

### **Total Estimado**:
- **Custo total estimado**: R$ 1.500 a R$ 5.000/mês, dependendo do tráfego, armazenamento e requisitos de processamento.

---

## Conclusão

A arquitetura de nuvem Azure proposta para o backend em Node.js e frontend em React Native é projetada para garantir:

- **Alta Disponibilidade**: Com balanceamento de carga e serviços redundantes.
- **Escalabilidade**: A infraestrutura pode crescer automaticamente para lidar com picos de tráfego.
- **Resiliência**: O uso de mensageria (Event Hub ou Service Bus) garante que as mensagens e dados não sejam perdidos, mesmo em caso de falhas temporárias.
- **Segurança**: Serviços gerenciados, como Azure SQL e Event Hub, oferecem criptografia e conformidade com padrões de segurança.

