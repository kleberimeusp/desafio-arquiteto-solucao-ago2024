# Estimativa de Custos para Migração de Sistema Legado

Este documento fornece uma análise detalhada dos custos relacionados à migração de um sistema legado para um novo sistema, considerando a infraestrutura, licenciamento de software e mão de obra especializada. A estimativa final dependerá da escolha de soluções específicas e do tamanho da infraestrutura.

## 1. Infraestrutura de Servidores

### Servidores Físicos ou Nuvem
- **Servidores Físicos**:
  - Aquisição e manutenção de hardware.
  - **Custo estimado**: Entre R$ 10.000 e R$ 50.000 por servidor, dependendo da configuração.

- **Servidores na Nuvem** (AWS, Azure, GCP):
  - Custos baseados no uso de recursos (CPU, armazenamento, etc).
  - Exemplo de custos na AWS:
    - **EC2 (Instâncias de Computação)**: Aproximadamente R$ 350 a R$ 800/mês por instância.
    - **RDS (Banco de Dados Gerenciado)**: Aproximadamente R$ 600 a R$ 1.500/mês, dependendo da configuração.
    - **Armazenamento (EBS)**: Aproximadamente R$ 0,40 a R$ 1,50/GB/mês.

  - **Estimativa mensal para cloud**: Aproximadamente entre R$ 2.000 e R$ 5.000/mês para uma infraestrutura com 1 ou 2 instâncias médias e bancos de dados.

---

## 2. Banco de Dados

- **Open-source (MySQL/PostgreSQL)**:
  - Gratuitos, com suporte comercial opcional.
  - **MySQL Enterprise**: Aproximadamente R$ 25.000 a R$ 50.000 por ano.

- **Banco de Dados Proprietário** (Oracle, SQL Server):
  - **Custo estimado**: Entre R$ 50.000 e R$ 150.000 por servidor, dependendo da edição.

---

## 3. Licenciamento de Software

- **Sistemas Operacionais**:
  - **Linux**: Gratuito (open-source), com suporte comercial opcional.
  - **Windows Server**: Aproximadamente R$ 5.000 a R$ 10.000 por licença.

- **Ferramentas de Migração e Sincronização**:
  - **Open-source** (Talend, Apache Nifi): Gratuitas, com suporte comercial opcional.
  - **ETL Comercial** (Informatica, Talend Enterprise): Aproximadamente R$ 50.000 a R$ 100.000/ano, dependendo do volume de dados e suporte.

---

## 4. Custos de Armazenamento e Backup

### Cloud (AWS S3, EBS):
- **Armazenamento S3**: Aproximadamente R$ 0,10 por GB armazenado.
- **Backups (EBS, S3)**: Aproximadamente R$ 0,04 por GB/mês.

### Servidores Físicos:
- **Discos de Armazenamento**: Aproximadamente R$ 1.000 a R$ 2.500 por disco de 1 TB, mais custos com RAID.

---

## 5. Custos de Manutenção e Suporte

- **Servidores Físicos**: Aproximadamente 10% a 15% do custo do hardware por ano para contratos de manutenção.
- **Suporte de Software**: Para software open-source, o suporte pago pode variar entre R$ 20.000 a R$ 100.000 por ano, dependendo do escopo.

---

## 6. Mão de Obra Especializada

### Custos com Equipe de TI:
- **Arquitetos de Soluções**: Aproximadamente R$ 15.000 a R$ 25.000/mês.
- **Desenvolvedores**: Aproximadamente R$ 8.000 a R$ 15.000/mês.
- **DBAs (Administradores de Banco de Dados)**: Aproximadamente R$ 10.000 a R$ 20.000/mês.
- **Equipe de Suporte**: Aproximadamente R$ 5.000 a R$ 10.000/mês para suporte de infraestrutura.

---

## 7. Licenciamento para Ferramentas de Monitoramento

- **Open-source** (Zabbix, Nagios): Gratuitas, mas exigem configuração.
- **Soluções Comerciais** (Datadog, New Relic): Aproximadamente R$ 20.000 a R$ 100.000 por ano.

---

## Exemplo de Estimativa Geral de Custos

### Infraestrutura em Nuvem (1 a 2 servidores)
- **Instâncias de Servidores na Nuvem**: R$ 2.000 a R$ 5.000/mês.
- **Licenciamento de Software Proprietário (se necessário)**: R$ 50.000 a R$ 150.000/ano.
- **Serviço de Sincronização/ETL (Enterprise)**: R$ 50.000 a R$ 100.000/ano.
- **Armazenamento de Dados**: R$ 1.000 a R$ 2.000/mês.
- **Suporte Técnico e Licenças de Ferramentas de Monitoramento**: R$ 50.000 a R$ 100.000/ano.
- **Equipe de TI (desenvolvedores, DBAs, arquitetos)**: R$ 30.000 a R$ 60.000/mês.

---

## Resumo Total Anual Estimado

- **Infraestrutura em Nuvem + Licenças + Mão de Obra**: Aproximadamente R$ 200.000 a R$ 500.000 por ano, dependendo da escala e dos serviços contratados.
