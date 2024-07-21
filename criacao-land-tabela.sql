CREATE TABLE `roxpartner-estagiarios-infra.LAND_PROTHEUS.land_fornecedores`
(
  codigo_fornecedor STRING NOT NULL,
  nome_fornecedor STRING,
  cnpj STRING,
  ativo STRING,
  endereco STRING,
  numero STRING,
  complemento STRING,
  cep STRING,
  bairro STRING,
  email STRING,
  data_cadastro STRING,
  data_atualizacao STRING
)
PARTITION BY TIMESTAMP_TRUNC(_PARTITIONTIME, DAY)
OPTIONS (
  partition_expiration_days = 30.0
);