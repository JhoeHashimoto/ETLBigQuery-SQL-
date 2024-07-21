MERGE `roxpartner-estagiarios-infra.TRUSTED_PROTHEUS.trusted_fornecedores` as target
using (
  WITH tabela_filter as (
    select
      CAST(codigo_fornecedor AS INT64) as codigo_fornecedor,
      CAST(nome_fornecedor AS STRING) as nome_fornecedor, 
      CAST(cnpj AS STRING) as cnpj,
      CAST(ativo AS STRING) as ativo,
      CAST(endereco AS STRING) as endereco,
      CAST(numero AS STRING) as numero,
      CAST(complemento AS STRING) as complemento,
      CAST(cep AS NUMERIC) as cep,
      CAST(bairro AS STRING) as bairro,
      CAST(email AS STRING) as email,
      CAST(data_cadastro AS DATE) as data_cadastro,
      CAST(data_atualizacao AS TIMESTAMP) as data_atualizacao
    from `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores`
    WHERE PARTITIONTIME = (SELECT MAX(PARTITIONTIME) FROM `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores`)),
    RAW_NUMBER as (
      select
      ROW_NUMBER() OVER(PARTITION BY codigo_fornecedor ORDER BY data_atualizacao desc) as rank,
      *
      from
      tabela_filter
    )
    select
      DISTINCT
        *
        EXCEPT(rank) FROM
        RAW_NUMBER
        WHERE rank = 1) source
on target.codigo_fornecedor = source.codigo_fornecedor
WHEN MATCHED THEN
  UPDATE SET
    target.codigo_fornecedor = source.codigo_fornecedor,
    target.nome_fornecedor = source.nome_fornecedor,
    target.cnpj = source.cnpj,
    target.ativo = source.ativo,
    target.endereco = source.endereco,
    target.numero = source.numero,
    target.complemento = source.complemento,
    target.cep = source.cep,
    target.bairro = source.bairro,
    target.email = source.email,
    target.data_cadastro = source.data_cadastro,
    target.data_atualizacao = source.data_atualizacao
WHEN NOT MATCHED THEN
  INSERT (codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao)
  VALUES (source.codigo_fornecedor, source.nome_fornecedor, source.cnpj, source.ativo, source.endereco,source.numero, source.complemento, source.cep, source.bairro, source.email, source.data_cadastro , source.data_atualizacao)


