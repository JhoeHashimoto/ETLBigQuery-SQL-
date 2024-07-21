INSERT INTO `roxpartner-estagiarios-infra.PROD_PROTHEUS.prodincremental_fornecedores`
(codigo_fornecedor, nome_fornecedor, cnpj, ativo, endereco, numero, complemento, cep, bairro, email, data_cadastro, data_atualizacao)
VALUES
(1, 'NETFLIX', '12345678000100', 'N', 'Rua Alpha', '100', 'Apto 101', 12345678, 'Centro', 'netflix@fornecedor.com', DATE('2023-01-01'), TIMESTAMP('2023-01-01 10:00:00 UTC')),
(6, 'CACAUSHOW', '67890123000105', 'S', 'Rua Zeta', '600', 'Apto 606', 67890123, 'Jardins', 'cacaushow@fornecedor.com', DATE('2023-06-01'), TIMESTAMP('2023-06-01 15:00:00 UTC')),
(3, 'CIMED', '34567890000102', 'N', 'Rua Gamma', '300', 'Apto 303',34567890, 'Centro', 'cimed@fornecedor.com', DATE('2023-03-01'), TIMESTAMP('2023-03-01 12:00:00 UTC')),
(11, 'REDBULL', '56789012000124', 'S', 'Rua zedasilva', '200', 'Apto 505', 56789012, 'Sertao', 'redbull@fornecedor.com', DATE('2024-10-01'), TIMESTAMP('2023-05-01 15:00:00 UTC')),
(12, 'MONSTER', '89012345000107', 'N', 'Rua omegamedelincartel', '800', 'Apto 808', 89012345, 'SaoJenuario', 'monster@fornecedor.com', DATE('2023-08-01'), TIMESTAMP('2023-08-01 17:00:00 UTC'));