TRUNCATE TABLE `roxpartner-estagiarios-infra.TRUSTED_PROTHEUS.trusted_fornecedores`;
INSERT INTO `roxpartner-estagiarios-infra.TRUSTED_PROTHEUS.trusted_fornecedores`
    (codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao)
WITH trusted_cargafull_fornecedores AS (
    SELECT DISTINCT
        CAST(codigo_fornecedor AS INT64) AS codigo_fornecedor,
        CAST(nome_fornecedor AS STRING) AS nome_fornecedor,
        CAST(cnpj AS STRING) AS cnpj,
        CAST(ativo AS STRING) AS ativo,
        CAST(endereco AS STRING) AS endereco,
        CAST(numero AS STRING) AS numero,
        CAST(complemento AS STRING) AS complemento,
        CAST(cep AS NUMERIC) AS cep,
        CAST(bairro AS STRING) AS bairro,
        CAST(email AS STRING) AS email,
        CAST(data_cadastro AS DATE) AS data_cadastro,
        CAST(data_atualizacao AS TIMESTAMP) AS data_atualizacao
    FROM `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores`
)
SELECT *
FROM trusted_cargafull_fornecedores;