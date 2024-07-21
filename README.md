####################PROJETO DE ETL NO BIGQUERY####################

A partir da seguinte tabela:

_producao.fornecedores (
      codigo_fornecedor    int
      ,nome_fornecedor     varchar(50)
      ,cnpj                number -- SOMENTE NUMEROS
      ,ativo               char(1) default 'N' -- ATIVO=S , INATIVO=N
      ,endereco            varchar(255)
      ,numero              varchar(50)
      ,complemento         varchar(255)
      ,cep                 number -- SOMENTE NUMEROS
      ,bairro              varchar(255)
      ,email               varchar(255)
      ,data_cadastro       date
      ,data_atualizacao    timestamp
)_

Foi realizado a criação, população e transição de camadas dentro de um _DATA LAKE_

Utilizando as camadas PROD, LAND, RAW e TRUSTED.

PROD----> contém apenas a tabela que será ingerida

LAND----> faz ingestão dos dados de produção

RAW-----> Empilha os registros versionando-os

TRUSTED-----> Merge dos dados


Para a carga full, utilizamos a seguinte premissa:

1. Criação de CTE para trazer os dados da camada subsequente e poder popular a próxima camada
2. Utilização de _PARTITIONTIME nativo do BQ.
3. Utilização de Cluster
4. Ingestão de produção com CAST _STRING_ na LAND, CAST final correspondente na TRUSTED

Para a carga incremental, utilizamos a seguinte premissa:

1. Ingestão de PROD para LAND, com filtro WHERE na CTE pegando pelo SELECT(MAX(data_atualizacao) from PROD 'Scan apenas em registros com update e insert'
2. PROD não contém deletes
3. RAW adiciona um campo PARTITIONTIME na tabela, popula o campo através do campo nativo __PARTITIONTIME_, após a ingestão trunca a land
4. TRUSTED, _MERGE_ utilizando o filtro de MAX(PARTITIONTIME), no entanto cria mais uma CTE para classificar a ordem de partitiontime por registro, atrelando um RANK de ROW_NUMBER para partição, irá pegar apenas a última partição que é classificada como 1
5. Atualiza registros na correspondência do id,
6. Quando NÃO há correspondência, faz-se o INSERT



