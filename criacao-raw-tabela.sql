CREATE OR REPLACE TABLE `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores`
(
  codigo_fornecedor STRING NOT NULL,
  nome_fornecedor STRING(50),
  cnpj STRING(255),
  ativo STRING(1),
  endereco STRING(255),
  numero STRING(50),
  complemento STRING(255),
  cep STRING,
  bairro STRING(255),
  email STRING(255),
  data_cadastro STRING,
  data_atualizacao STRING,
  PARTITIONTIME TIMESTAMP
)
PARTITION BY TIMESTAMP_TRUNC(PARTITIONTIME, DAY)
CLUSTER BY codigo_fornecedor;















































-- CREATE TABLE `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores`
-- PARTITION BY TIMESTAMP_TRUNC(PARTITIONTIME, DAY) AS
-- SELECT 
--   codigo_fornecedor,
--   nome_fornecedor,
--   cnpj,
--   ativo,
--   endereco,
--   numero,
--   complemento,
--   cep,
--   bairro,
--   email,
--   data_cadastro,
--   data_atualizacao,
--   _PARTITIONTIME as PARTITIONTIME
-- FROM
--   `roxpartner-estagiarios-infra.LAND_PROTHEUS.land_fornecedores`;

--ao rodar o script acima, todos os dados presente na tabela de land serão enviados para a tabela criada