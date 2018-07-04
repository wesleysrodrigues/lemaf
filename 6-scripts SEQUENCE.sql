-- SEQUENCE: "TRANSMADEIRA".veiculo_id_veiculo_seq

-- DROP SEQUENCE "TRANSMADEIRA".veiculo_id_veiculo_seq;

CREATE SEQUENCE "TRANSMADEIRA".veiculo_id_veiculo_seq;

ALTER SEQUENCE "TRANSMADEIRA".veiculo_id_veiculo_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".veiculo_id_veiculo_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".veiculo_id_veiculo_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".telefones_id_telefone_seq

-- DROP SEQUENCE "TRANSMADEIRA".telefones_id_telefone_seq;

CREATE SEQUENCE "TRANSMADEIRA".telefones_id_telefone_seq;

ALTER SEQUENCE "TRANSMADEIRA".telefones_id_telefone_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".telefones_id_telefone_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".telefones_id_telefone_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq

-- DROP SEQUENCE "TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq;

CREATE SEQUENCE "TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq;

ALTER SEQUENCE "TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".rotas_id_rota_seq

-- DROP SEQUENCE "TRANSMADEIRA".rotas_id_rota_seq;

CREATE SEQUENCE "TRANSMADEIRA".rotas_id_rota_seq;

ALTER SEQUENCE "TRANSMADEIRA".rotas_id_rota_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".rotas_id_rota_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".rotas_id_rota_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq

-- DROP SEQUENCE "TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq;

CREATE SEQUENCE "TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq;

ALTER SEQUENCE "TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".municipios_id_municipio_seq

-- DROP SEQUENCE "TRANSMADEIRA".municipios_id_municipio_seq;

CREATE SEQUENCE "TRANSMADEIRA".municipios_id_municipio_seq;

ALTER SEQUENCE "TRANSMADEIRA".municipios_id_municipio_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".municipios_id_municipio_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".municipios_id_municipio_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".madeiras_id_madeira_seq

-- DROP SEQUENCE "TRANSMADEIRA".madeiras_id_madeira_seq;

CREATE SEQUENCE "TRANSMADEIRA".madeiras_id_madeira_seq;

ALTER SEQUENCE "TRANSMADEIRA".madeiras_id_madeira_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".madeiras_id_madeira_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".madeiras_id_madeira_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq

-- DROP SEQUENCE "TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq;

CREATE SEQUENCE "TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq;

ALTER SEQUENCE "TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq TO PUBLIC;

-- SEQUENCE: "TRANSMADEIRA".enderecos_id_endereco_seq

-- DROP SEQUENCE "TRANSMADEIRA".enderecos_id_endereco_seq;

CREATE SEQUENCE "TRANSMADEIRA".enderecos_id_endereco_seq;

ALTER SEQUENCE "TRANSMADEIRA".enderecos_id_endereco_seq
    OWNER TO trans_madeira;

GRANT ALL ON SEQUENCE "TRANSMADEIRA".enderecos_id_endereco_seq TO trans_madeira WITH GRANT OPTION;

GRANT USAGE, SELECT ON SEQUENCE "TRANSMADEIRA".enderecos_id_endereco_seq TO PUBLIC;