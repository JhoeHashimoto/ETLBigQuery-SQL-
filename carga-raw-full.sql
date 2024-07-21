INSERT INTO `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores`
    (codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao, PARTITIONTIME)
WITH raw_cargafull_fornecedores AS (
    SELECT
        codigo_fornecedor,
        nome_fornecedor,
        cnpj,
        ativo,
        endereco,
        numero,
        complemento,
        cep,
        bairro,
        email,
        data_cadastro,
        data_atualizacao,
        _PARTITIONTIME AS PARTITIONTIME
    FROM `roxpartner-estagiarios-infra.LAND_PROTHEUS.land_fornecedores`
)
SELECT *
FROM raw_cargafull_fornecedores;