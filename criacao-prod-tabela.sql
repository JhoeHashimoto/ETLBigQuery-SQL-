CREATE OR REPLACE TABLE `roxpartner-estagiarios-infra.PROD_PROTHEUS.prod_fornecedores`
(
  codigo_fornecedor INT64 NOT NULL,
  nome_fornecedor STRING(50),
  cnpj STRING(255),
  ativo STRING(1) DEFAULT 'N',
  endereco STRING(255),
  numero STRING(50),
  complemento STRING(255),
  cep NUMERIC,
  bairro STRING(255),
  email STRING(255),
  data_cadastro DATE,
  data_atualizacao TIMESTAMP
)
CLUSTER BY codigo_fornecedor;
