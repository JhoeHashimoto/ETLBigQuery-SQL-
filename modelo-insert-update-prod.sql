INSERT INTO `roxpartner-estagiarios-infra.PROD_PROTHEUS.prod_fornecedores`
(codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao)
VALUES
(1001, 'ROXPARTNER', '45678901000103', 'N', 'Rua Delta', '400', 'Apto 404', 45678901, 'Jardins', 'roxpartner@fornecedor.com', DATE('2023-04-01'), CURRENT_TIMESTAMP);


UPDATE `roxpartner-estagiarios-infra.PROD_PROTHEUS.prod_fornecedores` SET nome_fornecedor = 'ROXPERT',
data_atualizacao = current_timestamp()
where codigo_fornecedor = 1001;

