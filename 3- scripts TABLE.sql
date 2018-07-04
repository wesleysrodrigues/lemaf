-- Table: "TRANSMADEIRA".usuarios

-- DROP TABLE "TRANSMADEIRA".usuarios;

CREATE TABLE "TRANSMADEIRA".usuarios
(
    cpf character(11) COLLATE pg_catalog."default" NOT NULL,
    nome character(40) COLLATE pg_catalog."default" NOT NULL,
    login character(20) COLLATE pg_catalog."default" NOT NULL,
    senha character(10) COLLATE pg_catalog."default" NOT NULL,
    data_nascimento timestamp without time zone NOT NULL,
    data_cadastro timestamp without time zone NOT NULL,
    data_desativado timestamp without time zone,
    desativado smallint NOT NULL,
    CONSTRAINT "PK_USUARIO_CPF" PRIMARY KEY (cpf),
    CONSTRAINT "UNIQUE_USUARIOS_CPF" UNIQUE (cpf)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".usuarios OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".usuarios TO trans_madeira;

-- Table: "TRANSMADEIRA".telefones

-- DROP TABLE "TRANSMADEIRA".telefones;

CREATE TABLE "TRANSMADEIRA".telefones
(
    id_telefone bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".telefones_id_telefone_seq'::regclass),
    ddd integer NOT NULL,
    numero integer NOT NULL,
    tipo smallint NOT NULL,
    CONSTRAINT "PK_TELEFONE_ID" PRIMARY KEY (id_telefone)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".telefones
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".telefones TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".telefones TO PUBLIC;

-- Table: "TRANSMADEIRA".paises

-- DROP TABLE "TRANSMADEIRA".paises;

CREATE TABLE "TRANSMADEIRA".paises
(
    sigla character(3) COLLATE pg_catalog."default" NOT NULL,
    nome character(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_PAISES_SIGLAS" PRIMARY KEY (sigla),
    CONSTRAINT "UNIQUE_PAISES_SIGLAS" UNIQUE (sigla)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;


ALTER TABLE "TRANSMADEIRA".paises OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".paises TO trans_madeira;

-- Table: "TRANSMADEIRA".estados

-- DROP TABLE "TRANSMADEIRA".estados;

CREATE TABLE "TRANSMADEIRA".estados
(
    uf character(2) COLLATE pg_catalog."default" NOT NULL,
    nome character(45) COLLATE pg_catalog."default" NOT NULL,
    pais_sigla character(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_ESTADOS_UF" PRIMARY KEY (uf),
    CONSTRAINT "UNIQUE_ESTADOS_UF" UNIQUE (uf),
    CONSTRAINT "FK_ESTADO_PAISES" FOREIGN KEY (pais_sigla)
        REFERENCES "TRANSMADEIRA".paises (sigla) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".estados OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".estados TO trans_madeira;

-- Table: "TRANSMADEIRA".municipios

-- DROP TABLE "TRANSMADEIRA".municipios;

CREATE TABLE "TRANSMADEIRA".municipios
(
    id_municipio bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".municipios_id_municipio_seq'::regclass),
    nome character(45) COLLATE pg_catalog."default" NOT NULL,
    uf character(2) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_MUNICIPIO_ID" PRIMARY KEY (id_municipio),
    CONSTRAINT "FK_MUNICIPIO_ESTADO_UF" FOREIGN KEY (uf)
        REFERENCES "TRANSMADEIRA".estados (uf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".municipios
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".municipios TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".municipios TO PUBLIC;
-- Table: "TRANSMADEIRA".enderecos

-- DROP TABLE "TRANSMADEIRA".enderecos;

CREATE TABLE "TRANSMADEIRA".enderecos
(
    id_endereco bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".enderecos_id_endereco_seq'::regclass),
    rua character(45) COLLATE pg_catalog."default",
    numero integer,
    complemento character(20) COLLATE pg_catalog."default",
    bairro character(20) COLLATE pg_catalog."default" NOT NULL,
    tipo smallint NOT NULL,
    municipio_id bigint,
    data_desativado timestamp without time zone,
    CONSTRAINT "PK_ENDERECO_ID" PRIMARY KEY (id_endereco),
    CONSTRAINT "FK_ENDERECO_MUNICIPIO_ID" FOREIGN KEY (municipio_id)
        REFERENCES "TRANSMADEIRA".municipios (id_municipio) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".enderecos
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".enderecos TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".enderecos TO PUBLIC;

-- Table: "TRANSMADEIRA".proprietarios

-- DROP TABLE "TRANSMADEIRA".proprietarios;

CREATE TABLE "TRANSMADEIRA".proprietarios
(
    cpf character(11) COLLATE pg_catalog."default" NOT NULL,
    usuario_cpf character(11) COLLATE pg_catalog."default" NOT NULL,
    nome character(45) COLLATE pg_catalog."default" NOT NULL,
    endereco_id bigint NOT NULL,
    telefone_id bigint,
    data_nascimento timestamp without time zone NOT NULL,
    data_cadastro timestamp without time zone NOT NULL,
    data_desativado timestamp without time zone,
    CONSTRAINT "PK_PROPRIETARIO_CPF" PRIMARY KEY (cpf),
    CONSTRAINT "UNIQUE_PROPRIETARIOS_CPF" UNIQUE (cpf),
    CONSTRAINT "FK_PROPRIETARIO_ENDERECO_ID" FOREIGN KEY (endereco_id)
        REFERENCES "TRANSMADEIRA".enderecos (id_endereco) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PROPRIETARIO_TELEFONE_ID" FOREIGN KEY (telefone_id)
        REFERENCES "TRANSMADEIRA".telefones (id_telefone) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_PROPRIETARIO_USUARIO_CPF" FOREIGN KEY (usuario_cpf)
        REFERENCES "TRANSMADEIRA".usuarios (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".proprietarios
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".proprietarios TO trans_madeira WITH GRANT OPTION;

-- Table: "TRANSMADEIRA".empreendimentos

-- DROP TABLE "TRANSMADEIRA".empreendimentos;

CREATE TABLE "TRANSMADEIRA".empreendimentos
(
    cnpj character(14) COLLATE pg_catalog."default" NOT NULL,
    proprietario_cpf character(11) COLLATE pg_catalog."default" NOT NULL,
    razao_social character(45) COLLATE pg_catalog."default" NOT NULL,
    nome_fantasia character(45) COLLATE pg_catalog."default" NOT NULL,
    endereco_id bigint NOT NULL,
    filial smallint NOT NULL,
    data_criacao timestamp without time zone NOT NULL,
    data_desativado timestamp without time zone,
    CONSTRAINT "PK_EMPREENDIMENTO_CNPJ" PRIMARY KEY (cnpj),
    CONSTRAINT "UNIQUE_EMPREENDIMENTO_CNPJ" UNIQUE (cnpj),
    CONSTRAINT "FK_EMPREENDIMENTO_ENDERECO_ID" FOREIGN KEY (endereco_id)
        REFERENCES "TRANSMADEIRA".enderecos (id_endereco) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_EMPREENDIMENTO_PROPRIETARIO_CPF" FOREIGN KEY (proprietario_cpf)
        REFERENCES "TRANSMADEIRA".proprietarios (cpf) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".empreendimentos
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".empreendimentos TO trans_madeira WITH GRANT OPTION;

-- Table: "TRANSMADEIRA".proprietarios_empreendimentos

-- DROP TABLE "TRANSMADEIRA".proprietarios_empreendimentos;

CREATE TABLE "TRANSMADEIRA".proprietarios_empreendimentos
(
    id_prop_empr bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".proprietarios_empreendimentos_id_prop_empr_seq'::regclass),
    proprietario_cpf character(11) COLLATE pg_catalog."default" NOT NULL,
    empreendimento_cnpj character(14) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "PK_PROP_EMP_ID_CPF_CNPJ" PRIMARY KEY (id_prop_empr, proprietario_cpf, empreendimento_cnpj)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".proprietarios_empreendimentos  OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".proprietarios_empreendimentos TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".proprietarios_empreendimentos TO PUBLIC;

-- Table: "TRANSMADEIRA".madeiras

-- DROP TABLE "TRANSMADEIRA".madeiras;

CREATE TABLE "TRANSMADEIRA".madeiras
(
    id_madeira bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".madeiras_id_madeira_seq'::regclass),
    nome_especie character(45) COLLATE pg_catalog."default" NOT NULL,
    nome_cientifico character(45) COLLATE pg_catalog."default",
    data_criacao timestamp without time zone NOT NULL,
    data_desativado timestamp without time zone,
    CONSTRAINT "PK_MADEIRAS_ID" PRIMARY KEY (id_madeira)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".madeiras
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".madeiras TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".madeiras TO PUBLIC;	

-- Table: "TRANSMADEIRA".rotas

-- DROP TABLE "TRANSMADEIRA".rotas;

CREATE TABLE "TRANSMADEIRA".rotas
(
    id_rota bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".rotas_id_rota_seq'::regclass),
    data_cadastro timestamp without time zone NOT NULL,
    municipio_origem bigint NOT NULL,
    municipio_destino bigint NOT NULL,
    data_desativado timestamp without time zone,
    coordenada_origem point,
    coordenada_destino point,
    CONSTRAINT "PK_ROTA_ID" PRIMARY KEY (id_rota)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".rotas
    OWNER to postgres;

GRANT ALL ON TABLE "TRANSMADEIRA".rotas TO postgres WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".rotas TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".rotas TO PUBLIC;

-- Table: "TRANSMADEIRA".veiculos

-- DROP TABLE "TRANSMADEIRA".veiculos;

CREATE TABLE "TRANSMADEIRA".veiculos
(
    id_veiculo bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".veiculo_id_veiculo_seq'::regclass),
    capacidade_m3 integer,
    altura double precision NOT NULL,
    comprimento double precision NOT NULL,
    largura double precision NOT NULL,
    status smallint NOT NULL,
    data_cadastro timestamp without time zone NOT NULL,
    data_desativado timestamp without time zone,
    empreendimento_cnpj character(14) COLLATE pg_catalog."default",
    ano_fabricacao integer,
    CONSTRAINT "PK_VEICULO_ID" PRIMARY KEY (id_veiculo),
    CONSTRAINT "FK_EMPREENDIMENTO_CNPJ" FOREIGN KEY (empreendimento_cnpj)
        REFERENCES "TRANSMADEIRA".empreendimentos (cnpj) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".veiculos
    OWNER to trans_madeira;
	
-- Table: "TRANSMADEIRA".veiculo_ferroviarias

-- DROP TABLE "TRANSMADEIRA".veiculo_ferroviarias;

CREATE TABLE "TRANSMADEIRA".veiculo_ferroviarias
(
    id_veiculo ,
    capacidade_m3 ,
    altura ,
    comprimento ,
    largura ,
    status ,
    data_cadastro ,
    data_desativado ,
    empreendimento_cnpj ,
    ano_fabricacao ,
    numero integer NOT NULL,
    linha character(20) COLLATE pg_catalog."default" NOT NULL,
    numero_vagoes integer NOT NULL,
    CONSTRAINT "PK_VEIC_FERR_NUMERO" PRIMARY KEY (numero)
)
    INHERITS ("TRANSMADEIRA".veiculos)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".veiculo_ferroviarias
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculo_ferroviarias TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculo_ferroviarias TO PUBLIC;

-- Table: "TRANSMADEIRA".veiculo_fluviais

-- DROP TABLE "TRANSMADEIRA".veiculo_fluviais;

CREATE TABLE "TRANSMADEIRA".veiculo_fluviais
(
    id_veiculo ,
    capacidade_m3 ,
    altura ,
    comprimento ,
    largura ,
    status ,
    data_cadastro ,
    data_desativado ,
    empreendimento_cnpj ,
    ano_fabricacao ,
    tipo_embarcacao smallint NOT NULL,
    nome_hidrovia character(30) COLLATE pg_catalog."default" NOT NULL
)
    INHERITS ("TRANSMADEIRA".veiculos)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".veiculo_fluviais
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculo_fluviais TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculo_fluviais TO PUBLIC;

-- Table: "TRANSMADEIRA".veiculos_maritimos

-- DROP TABLE "TRANSMADEIRA".veiculos_maritimos;

CREATE TABLE "TRANSMADEIRA".veiculos_maritimos
(
    id_veiculo ,
    capacidade_m3 ,
    altura ,
    comprimento ,
    largura ,
    status ,
    data_cadastro ,
    data_desativado ,
    empreendimento_cnpj ,
    ano_fabricacao ,
    num_inscricao bigint NOT NULL,
    pais_sigla character(3) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "FK_VEIC_MARIT_PAISES_SIGLA" FOREIGN KEY (pais_sigla)
        REFERENCES "TRANSMADEIRA".paises (sigla) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
    INHERITS ("TRANSMADEIRA".veiculos)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".veiculos_maritimos
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculos_maritimos TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculos_maritimos TO PUBLIC;

-- Table: "TRANSMADEIRA".veiculos_rodoviarios

-- DROP TABLE "TRANSMADEIRA".veiculos_rodoviarios;

CREATE TABLE "TRANSMADEIRA".veiculos_rodoviarios
(
    id_veiculo ,
    capacidade_m3 ,
    altura ,
    comprimento ,
    largura ,
    status ,
    data_cadastro ,
    data_desativado ,
    empreendimento_cnpj ,
    ano_fabricacao ,
    placa character(8) COLLATE pg_catalog."default" NOT NULL,
    modelo character(20) COLLATE pg_catalog."default" NOT NULL,
    renavam character(20) COLLATE pg_catalog."default" NOT NULL,
    chassi character(20) COLLATE pg_catalog."default" NOT NULL,
    marca character(10) COLLATE pg_catalog."default" NOT NULL,
    qtd_eixos integer,
    CONSTRAINT "UNIQUE_VEIC_CHASSI" UNIQUE (chassi),
    CONSTRAINT "UNIQUE_VEIC_PROD_RENAVAM" UNIQUE (renavam),
    CONSTRAINT "UNIQUE_VEIC_ROD_PLACA" UNIQUE (placa)
)
    INHERITS ("TRANSMADEIRA".veiculos)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".veiculos_rodoviarios
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculos_rodoviarios TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".veiculos_rodoviarios TO PUBLIC;

-- Table: "TRANSMADEIRA".rotas_veiculos

-- DROP TABLE "TRANSMADEIRA".rotas_veiculos;

CREATE TABLE "TRANSMADEIRA".rotas_veiculos
(
    id_rota_veiculo bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".rotas_veiculos_id_rota_veiculo_seq'::regclass),
    rota_id bigint NOT NULL,
    veiculo_id bigint NOT NULL,
    CONSTRAINT "PK_ROTA_VEICULO_ID" PRIMARY KEY (id_rota_veiculo, rota_id, veiculo_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".rotas_veiculos
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".rotas_veiculos TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".rotas_veiculos TO PUBLIC;

-- Table: "TRANSMADEIRA".guias_transportes_florestais

-- DROP TABLE "TRANSMADEIRA".guias_transportes_florestais;

CREATE TABLE "TRANSMADEIRA".guias_transportes_florestais
(
    id_guias_transp_florest bigint NOT NULL DEFAULT nextval('"TRANSMADEIRA".guias_transportes_florestais_id_guias_transp_florest_seq'::regclass),
    rota_veiculo_id bigint NOT NULL,
    madeira_id bigint NOT NULL,
    data_validade timestamp without time zone NOT NULL,
    volume_m3 double precision NOT NULL,
    data_validade_dae timestamp without time zone NOT NULL,
    valor double precision NOT NULL,
    tipo smallint NOT NULL,
    CONSTRAINT "PK_GUIAS_ID" PRIMARY KEY (id_guias_transp_florest, madeira_id),
    CONSTRAINT "UNIQUE_GUIAS" UNIQUE (id_guias_transp_florest),
    CONSTRAINT "FK_GUIA_ROTA_VEIC_ID" FOREIGN KEY (rota_veiculo_id)
        REFERENCES "TRANSMADEIRA".rotas_veiculos (id_rota_veiculo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".guias_transportes_florestais
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".guias_transportes_florestais TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".guias_transportes_florestais TO PUBLIC;

-- Table: "TRANSMADEIRA".dae

-- DROP TABLE "TRANSMADEIRA".dae;

CREATE TABLE "TRANSMADEIRA".dae
(
    numero_dae bigint NOT NULL,
    data_dae timestamp without time zone NOT NULL,
    data_validade timestamp without time zone NOT NULL,
    volume_transp_m3 double precision NOT NULL,
    guia_transp_florest_id bigint NOT NULL,
    valor double precision NOT NULL,
    CONSTRAINT "UNIQUE_DAE_NUMERO" UNIQUE (numero_dae),
    CONSTRAINT "FK_DAE_GUIA_ID" FOREIGN KEY (guia_transp_florest_id)
        REFERENCES "TRANSMADEIRA".guias_transportes_florestais (id_guias_transp_florest) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "CHK_DAE_VALOR" CHECK (valor = 500::double precision) NOT VALID
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "TRANSMADEIRA".dae
    OWNER to trans_madeira;

GRANT ALL ON TABLE "TRANSMADEIRA".dae TO trans_madeira WITH GRANT OPTION;

GRANT ALL ON TABLE "TRANSMADEIRA".dae TO PUBLIC;

CREATE VIEW "TRANSMADEIRA".VW_SOMA_VOLUME_TRANSP AS 
SELECT 
	sum(volume_m3) volume_total,
	nome_especie
FROM "TRANSMADEIRA".guias_transportes_florestais gtf
	inner join "TRANSMADEIRA".madeiras m on m.id_madeira = gtf.madeira_id
group by nome_especie;

