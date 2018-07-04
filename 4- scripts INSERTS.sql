--INSERINDO USUARIO
INSERT INTO "TRANSMADEIRA".usuarios(cpf, nome, login, senha,data_nascimento, data_cadastro,data_desativado,desativado)
	VALUES ('06822260684', 'Wesley Rodrigues', 'wesleyrodrigues', '12345678', '12/02/1985', CURRENT_TIMESTAMP, NULL, 0);

--INSERINDO PAÍS
INSERT INTO "TRANSMADEIRA".paises(sigla, nome)VALUES ('BRA', 'BRASIL');

--INSERINDO ESTADOS
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Acre', 'AC');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Alagoas', 'AL');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Amazonas', 'AM');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Amapá', 'AP');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Bahia', 'BA');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Ceará', 'CE');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Distrito Federal', 'DF');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Espirito Santo', 'ES');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Goiás', 'GO');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Maranhão', 'MA');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Minas Gerais', 'MG');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Mato Grosso do Sul', 'MS');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Mato Grosso', 'MT');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Pará', 'PA');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Paraíba', 'PB');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Pernambuco', 'PE');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Piauí', 'PI');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Paraná', 'PR');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Rio de Janeiro', 'RJ');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Rio Grande do Norte', 'RN');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Rondônia', 'RO');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Roraima', 'RR');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Rio Grande do Sul', 'RS');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Santa Catarina', 'SC');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Sergipe', 'SE');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','São Paulo', 'SP');
INSERT INTO "TRANSMADEIRA".estados(pais_sigla, nome, uf)  VALUES ('BRA','Tocantins', 'TO');

--INSERINDO MUNICIPIOS
INSERT INTO "TRANSMADEIRA".municipios(nome, uf) VALUES ('Oliveira', 'MG');
INSERT INTO "TRANSMADEIRA".municipios(nome, uf) VALUES ('Lavras', 'MG');
INSERT INTO "TRANSMADEIRA".municipios(nome, uf) VALUES ('Parambu', 'CE');
INSERT INTO "TRANSMADEIRA".municipios(nome, uf) VALUES ('Fortaleza', 'CE');

--INSERT ENDERECO
INSERT INTO "TRANSMADEIRA".enderecos(rua, numero, complemento, bairro, tipo, municipio_id, data_desativado)
	VALUES ('zona rural',null, 'km 37', 'teste', 3,3 , null);
INSERT INTO "TRANSMADEIRA".enderecos(rua, numero, complemento, bairro, tipo, municipio_id,  data_desativado)
	VALUES ('Avenida José de Souza',123, 'casa da vaca', 'Vargem grande', 3,2 , null);
INSERT INTO "TRANSMADEIRA".enderecos( rua, numero, complemento, bairro, tipo, municipio_id, data_desativado)
	VALUES ('Helia da Silva Freire',180, null, 'Jardim America', 0,2 , null);
INSERT INTO "TRANSMADEIRA".enderecos(rua, numero, complemento, bairro, tipo, municipio_id,  data_desativado)
	VALUES ('8 de dezembro',58, null, 'rosario', 0, 1,  null);

--INSERT TELEFONE
INSERT INTO "TRANSMADEIRA".telefones(ddd, numero, tipo) VALUES (35, 991956522, 0);

--PROPRIETARIOS
INSERT INTO "TRANSMADEIRA".proprietarios(cpf, cpf_usuario, nome, endereco_id, telefone_id, data_nascimento, data_cadastro, data_desativado)	
	VALUES ('06822260684', '06822260684', 'wesley rodrigues', 1, 1,'12/02/1985 00:00:00',  '02/07/2018 00:00:00', null);

INSERT INTO "TRANSMADEIRA".proprietarios(cpf, cpf_usuario, nome, endereco_id, telefone_id, data_nascimento, data_cadastro, data_desativado)	
	VALUES ('22222222222', '06822260684', 'Tião da Silva', 3, null,'01/01/1980 00:00:00',  current_timestamp, null);

INSERT INTO "TRANSMADEIRA".proprietarios(cpf, cpf_usuario, nome, endereco_id, telefone_id, data_nascimento, data_cadastro, data_desativado)	
	VALUES ('11111111111', '06822260684', 'clara rodrigues', 2, null,'27/08/2008 00:00:00', current_timestamp, null);

--INSERT EMPREENDIMENTO
INSERT INTO "TRANSMADEIRA".empreendimentos(cnpj, proprietario_cpf, razao_social, nome_fantasia, endereco_id, filial, data_criacao, data_desativado)
	VALUES ('11111111111111','06822260684', 'Madeiras Alegres Ldta', 'Madeiras Alegre', 1, 0, current_timestamp,null;
INSERT INTO "TRANSMADEIRA".empreendimentos(cnpj, proprietario_cpf, razao_social, nome_fantasia, endereco_id, filial, data_criacao, data_desativado)
	VALUES ('22222222222222','11111111111', 'Madeiras Horizonte', 'Madeiras Horizonte', 1, 0, current_timestamp,null);
INSERT INTO "TRANSMADEIRA".empreendimentos(cnpj, proprietario_cpf, razao_social, nome_fantasia, endereco_id, filial, data_criacao, data_desativado)
	VALUES ('33333333333333','222222222222', 'Transportadora de Madeiras Oliveira', 'Transportadora de Madeiras Oliveira', 1, 0, current_timestamp,null);
	
--INSERT PROPRIETARIOS / EMPREENDIMENTOS
INSERT INTO "TRANSMADEIRA".proprietarios_empreendimentos(empreendimento_cnpj, proprietario_cpf) VALUES ('11111111111111','06822260684');
INSERT INTO "TRANSMADEIRA".proprietarios_empreendimentos(empreendimento_cnpj, proprietario_cpf) VALUES ('22222222222222','06822260684');
INSERT INTO "TRANSMADEIRA".proprietarios_empreendimentos(empreendimento_cnpj, proprietario_cpf) VALUES ('33333333333333','11111111111');


-- INSERT VEICULOS Maritimos
INSERT INTO "TRANSMADEIRA".veiculos_maritimos( empreendimento_cnpj, ano_fabricacao,altura, comprimento, largura, status, data_cadastro, data_desativado,num_inscricao,pais_sigla)
	VALUES ( '1111111111111', 2015,5, 30, 10, 3, current_timestamp, null,111,'BRA');
--INSERT VEICULOS RODOVIARIOS
INSERT INTO "TRANSMADEIRA".veiculos_rodoviarios( empreendimento_cnpj, ano_fabricacao,altura, comprimento, largura, status, data_cadastro, data_desativado,placa,modelo,renavam,chassi,marca)
	VALUES ( '11111111111111', 2016,20, 5, 2, 1, current_timestamp, null,'gys-1248','truck','asrq1231','2331141','VW');
--INSERT VEICULOS_FLUVIAIS
INSERT INTO "TRANSMADEIRA".veiculo_fluviais( empreendimento_cnpj, ano_fabricacao,altura, comprimento, largura, status, data_cadastro, data_desativado,tipo_embarcacao,nome_hidrovia)
	VALUES ( '22222222222222', 2018,2, 100, 3, 1, current_timestamp, null,1,'Hidrovia do São Francisco');	]
--INSERT VEICULOS_FERROVIARIOS
INSERT INTO "TRANSMADEIRA".veiculo_ferroviarias( empreendimento_cnpj, ano_fabricacao,altura, comprimento, largura, status, data_cadastro, data_desativado,numero,linha,numero_vagoes)
	VALUES ( '22222222222222', 2018,30, 100, 20, 1, current_timestamp, null,1234,'lavras-Vitoria',30);

--INSERT ROTA
INSERT INTO "TRANSMADEIRA".rotas(data_cadastro, municipio_origem, municipio_destino, data_desativado, coordenada_origem, coordenada_destino,tipo)
	VALUES (CURRENT_TIMESTAMP, 1, 3, NULL, NULL, NULL,1);
INSERT INTO "TRANSMADEIRA".rotas(data_cadastro, municipio_origem, municipio_destino, data_desativado, coordenada_origem, coordenada_destino,tipo)
	VALUES (CURRENT_TIMESTAMP, 2, 4, NULL, NULL, NULL,2);
INSERT INTO "TRANSMADEIRA".rotas(data_cadastro, municipio_origem, municipio_destino, data_desativado, coordenada_origem, coordenada_destino,tipo)
	VALUES (CURRENT_TIMESTAMP, 4, 1, NULL, NULL, NULL,3);

--INSERT ROTA_VEICULOS
INSERT INTO "TRANSMADEIRA".rotas_veiculos(rota_id, veiculo_id) VALUES ( 1, 1);
INSERT INTO "TRANSMADEIRA".rotas_veiculos(rota_id, veiculo_id) VALUES ( 2, 3);
INSERT INTO "TRANSMADEIRA".rotas_veiculos(rota_id, veiculo_id) VALUES ( 3, 2);

--INSERT MADEIRA
INSERT INTO "TRANSMADEIRA".madeiras(nome_especie, data_criacao)	VALUES ('PINHEIRO', current_timestamp);
INSERT INTO "TRANSMADEIRA".madeiras(nome_especie, data_criacao)	VALUES ('JATOBA', current_timestamp);
INSERT INTO "TRANSMADEIRA".madeiras(nome_especie, data_criacao)	VALUES ('CEDRO', current_timestamp);
INSERT INTO "TRANSMADEIRA".madeiras(nome_especie, data_criacao)	VALUES ('CASTANHEIRA', current_timestamp);

--INSERT_GUIA
INSERT INTO "TRANSMADEIRA".guias_transportes_florestais(rota_veiculo_id, madeira_id, data_validade, volume_m3, data_validade_dae,  tipo)
	VALUES (1, 1, '03/08/2018', 300,'31/08/2018',  1 );
INSERT INTO "TRANSMADEIRA".guias_transportes_florestais(rota_veiculo_id, madeira_id, data_validade, volume_m3, data_validade_dae, tipo)
	VALUES (2, 2, '03/08/2018', 300,'31/08/2018',  2 );
INSERT INTO "TRANSMADEIRA".guias_transportes_florestais(rota_veiculo_id, madeira_id, data_validade, volume_m3, data_validade_dae, tipo)
	VALUES (3, 3, '03/08/2018', 300,'31/08/2018',  3 );
INSERT INTO "TRANSMADEIRA".guias_transportes_florestais(rota_veiculo_id, madeira_id, data_validade, volume_m3, data_validade_dae, tipo)
	VALUES (1, 3, '04/08/2018', 300,'31/08/2018',  3 );

-- INSERT DAE
INSERT INTO "TRANSMADEIRA".dae(	numero_dae, data_dae, data_validade, volume_transp_m3, guia_transp_florest_id, valor)VALUES (1234, '01/07/2018', '31/07/2018',580, 3, 500);
INSERT INTO "TRANSMADEIRA".dae(	numero_dae, data_dae, data_validade, volume_transp_m3, guia_transp_florest_id, valor)VALUES (1235, '01/07/2018', '31/07/2018',490, 2, 500);
INSERT INTO "TRANSMADEIRA".dae(	numero_dae, data_dae, data_validade, volume_transp_m3, guia_transp_florest_id, valor)VALUES (1236, '01/07/2018', '31/07/2018',580, 4, 500);


	




