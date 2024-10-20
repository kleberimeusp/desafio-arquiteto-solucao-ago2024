
# Sistema de Controle de Fluxo de Caixa

## Descrição do Projeto

O **Sistema de Controle de Fluxo de Caixa** é uma aplicação web que permite a comerciantes registrarem transações financeiras (como vendas, compras, pagamentos) e consultarem relatórios consolidados diários. O sistema também gera logs de auditoria para rastrear todas as operações realizadas e utiliza tecnologias modernas como Node.js, PostgreSQL, React.js e Kafka para garantir escalabilidade e robustez.

## Tecnologias Utilizadas

### Backend:
- **Node.js com Express** (API RESTful)
- **PostgreSQL** (Banco de dados relacional)
- **Kafka** (Mensageria para logs de auditoria)
- **Jest** (Testes unitários)
- **Supertest** (Testes de API)

### Frontend:
- **React.js** (Interface de usuário)
- **Axios** (Cliente HTTP para comunicação com o backend)

### Outros Serviços:
- **Elastic Stack (ELK)**: Para armazenar e visualizar logs de auditoria (Elasticsearch, Logstash, Kibana)

## Pré-requisitos

Antes de rodar a aplicação localmente, você precisará das seguintes ferramentas instaladas em sua máquina:

- **Node.js** (v14.x ou superior)
- **PostgreSQL** (v12.x ou superior)
- **Kafka** (v2.x ou superior)
- **Elastic Stack (Elasticsearch, Logstash, Kibana)** (opcional, para visualizar os logs de auditoria)

## Configuração do Ambiente

### 1. Clonar o Repositório
```bash
git clone https://github.com/usuario/fluxo-caixa.git
cd fluxo-caixa
```

### 2. Configurar o Backend

#### Instalar dependências
```bash
cd fluxo-caixa-backend
npm install
```

#### Configurar variáveis de ambiente
Crie um arquivo `.env` na raiz do diretório do backend com as seguintes configurações:

```makefile
PORT=3000
DB_HOST=localhost
DB_USER=seu_usuario_postgres
DB_PASSWORD=sua_senha_postgres
DB_NAME=fluxo_caixa
KAFKA_BROKER=localhost:9092
```

#### Configurar o Banco de Dados
Configure o banco de dados PostgreSQL com as informações do arquivo `.env`.

#### Subir o Kafka e Elastic Stack
- Inicie o Kafka em sua máquina e verifique se o broker está ativo em `localhost:9092`.
- Se estiver utilizando o Elastic Stack, inicie os serviços do **Elasticsearch**, **Logstash** e **Kibana**.

#### Rodar a aplicação backend
```bash
npm start
```
O servidor estará disponível em [http://localhost:3000](http://localhost:3000).

### 3. Configurar o Frontend

#### Instalar dependências
```bash
cd ../fluxo-caixa-frontend
npm install
```

#### Configurar variáveis de ambiente no Frontend
Crie um arquivo `.env` na raiz do diretório do frontend com as seguintes configurações:

```bash
REACT_APP_API_URL=http://localhost:3000/api
```

#### Rodar a aplicação frontend
```bash
npm start
```
O servidor frontend estará disponível em [http://localhost:3001](http://localhost:3001).

## Como Rodar Testes

### 1. Testes Unitários e de Integração (Backend)
Para rodar os testes unitários e de integração, utilize o Jest:
```bash
cd fluxo-caixa-backend
npm test
```

### 2. Testes de API
Os testes de API serão executados junto com os testes unitários, utilizando o Supertest para validar as chamadas REST.

## Como Usar a Aplicação

### 1. Cadastro de Transações
- Acesse a interface em [http://localhost:3001](http://localhost:3001).
- No formulário, preencha os dados da transação:
  - Valor
  - Tipo (Crédito ou Débito)
  - Descrição
- Clique em **Registrar** para adicionar a transação.

### 2. Consulta de Relatórios Consolidados
- Acesse a aba de **Relatórios**.
- Visualize os relatórios consolidados de transações diárias com o saldo total, débitos e créditos.

### 3. Logs de Auditoria
Se estiver utilizando o Elastic Stack, acesse o **Kibana** em [http://localhost:5601](http://localhost:5601) para visualizar os logs de auditoria de todas as operações realizadas.

## Testes de Carga e Performance

Para executar testes de carga, instale o **Artillery** e rode o seguinte comando para simular requisições de transações:

```bash
artillery run loadtest.yml
```

O arquivo `loadtest.yml` deve ser configurado para simular múltiplas requisições simultâneas e verificar o desempenho da aplicação sob carga.

## Estrutura do Projeto

### Backend

![alt text](C4%20Model%20Architect/0.%20default/02.png)

### Frontend

![alt text](C4%20Model%20Architect/0.%20default/01.png)

## Próximos Passos

- **Melhorias de Interface**: Adicionar mais validações no frontend para aprimorar a experiência do usuário.
- **Autenticação**: Implementar OAuth 2.0 ou JWT para melhorar a segurança.
- **Docker**: Configurar containers para facilitar o setup e deploy da aplicação com Docker.

---

Se houver qualquer problema ou dúvida ao rodar o projeto, entre em contato pelo email: suporte@fluxo-caixa.com.
