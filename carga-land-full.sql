INSERT INTO `roxpartner-estagiarios-infra.LAND_PROTHEUS.land_fornecedores` 
(codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao)
WITH land_cargafull_fornecedores AS (
    SELECT DISTINCT
        CAST(codigo_fornecedor AS STRING) AS codigo_fornecedor,
        CAST(nome_fornecedor AS STRING) AS nome_fornecedor,
        CAST(cnpj AS STRING) AS cnpj,
        CAST(ativo AS STRING) AS ativo,
        CAST(endereco AS STRING) AS endereco,
        CAST(numero AS STRING) AS numero,
        CAST(complemento AS STRING) AS complemento,
        CAST(cep AS STRING) AS cep,
        CAST(bairro AS STRING) AS bairro,
        CAST(email AS STRING) AS email,
        CAST(data_cadastro AS STRING) AS data_cadastro,
        CAST(data_atualizacao AS STRING) AS data_atualizacao
    FROM `roxpartner-estagiarios-infra.PROD_PROTHEUS.prod_fornecedores`
)
SELECT *
FROM land_cargafull_fornecedores;
