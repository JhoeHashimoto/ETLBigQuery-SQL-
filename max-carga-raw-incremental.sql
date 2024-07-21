INSERT INTO `roxpartner-estagiarios-infra.RAW_PROTHEUS.raw_fornecedores` 
(codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao, PARTITIONTIME)
WITH TABELA_FILTER AS (
SELECT DISTINCT
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
    WHERE _PARTITIONTIME = (SELECT MAX(_PARTITIONTIME) FROM `roxpartner-estagiarios-infra.LAND_PROTHEUS.land_fornecedores`)
)
SELECT * FROM TABELA_FILTER;
TRUNCATE TABLE `roxpartner-estagiarios-infra.LAND_PROTHEUS.land_fornecedores`
