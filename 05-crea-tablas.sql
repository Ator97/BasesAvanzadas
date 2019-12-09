--@Autors: Montecillo Sandoval jose Alejandro Oscar Gutiérrez Castillo
--@Fecha : 4 de Diciembre de 2019
--@Descripcion: Script de creacion de tablas e indices

-- ER/Studio 8.0 SQL Code Generation, with manual modifications

DROP TABLE ACTIVIDAD CASCADE CONSTRAINTS;
DROP TABLE ARTICULO CASCADE CONSTRAINTS;
DROP TABLE BANCO CASCADE CONSTRAINTS;
DROP TABLE CASA CASCADE CONSTRAINTS;
DROP TABLE CLIENTE CASCADE CONSTRAINTS;
DROP TABLE CLIENTE_SUBASTA CASCADE CONSTRAINTS;
DROP TABLE descripcion_factura CASCADE CONSTRAINTS;
DROP TABLE ESTADO CASCADE CONSTRAINTS;
DROP TABLE FACTURA CASCADE CONSTRAINTS;
DROP TABLE HACIENDA CASCADE CONSTRAINTS;
DROP TABLE HACIENDA_ACTIVIDAD CASCADE CONSTRAINTS;
DROP TABLE HISTORICO_STATUS_ARTICULO CASCADE CONSTRAINTS;
DROP TABLE MARCA_AUTO CASCADE CONSTRAINTS;
DROP TABLE MODELO_AUTO CASCADE CONSTRAINTS;
DROP TABLE PAIS CASCADE CONSTRAINTS;
DROP TABLE STATUS_ARTICULO CASCADE CONSTRAINTS;
DROP TABLE SUBASTA CASCADE CONSTRAINTS;
DROP TABLE SUBASTA_BIEN CASCADE CONSTRAINTS;
DROP TABLE VEHICULO CASCADE CONSTRAINTS;


DROP INDEX articulo_articulo_id_pk; 
DROP INDEX articulo_sai_fk; 
DROP INDEX articulo_cliente_id_fk; 
DROP INDEX actividad_api_pk; 
DROP INDEX banco_banco_id_pk; 
DROP INDEX cliente_banco_id_pk; 
DROP INDEX cliente_estadi_id_fk; 
DROP INDEX cliente_ava_fk; 
DROP INDEX cliente_banco_id_fk; 
DROP INDEX cs_ci_sbi_pk; 
DROP INDEX cs_ci_fk; 
DROP INDEX cs_sbi_fk; 
DROP INDEX df_dfi_pk; 
DROP INDEX df_sbi_fk; 
DROP INDEX df_factura_id_fk; 
DROP INDEX estado_estado; 
DROP INDEX estado_pais_id_fk; 
DROP INDEX factura_factura_id_pk; 
DROP INDEX factura_cliente_id_fk; 
DROP INDEX hacienda_articulo_id_pk; 
DROP INDEX hacienda_articulo_id_fk; 
DROP INDEX ha_api_ai_pk; 
DROP INDEX ha_api_fk; 
DROP INDEX ha_ai_fk; 
DROP INDEX hsa_hsai_pk; 
DROP INDEX hsa_sai_fk; 
DROP INDEX hsa_articulo_id_fk; 
DROP INDEX mau_marca_id_pk; 
DROP INDEX ma_modelo_id_pk; 
DROP INDEX ma_marca_id_fk; 
DROP INDEX pais_pais_id_pk; 
DROP INDEX sa_sai_pk; 
DROP INDEX subasta_subasta_id_pk; 
DROP INDEX sb_sbi_pk; 
DROP INDEX sb_si_fk; 
DROP INDEX sb_articulo_id_fk; 
DROP INDEX vehiculo_articulo_id_pk; 
DROP INDEX vehiculo_articulo_id_fk; 
DROP INDEX vehiculo_modelo_id_fk; 
DROP INDEX casa_articulo_id_pk; 
DROP INDEX casa_articulo_id_fk; 

-- TABLE: ACTIVIDAD 
CREATE TABLE ACTIVIDAD(
    actividad_prod_id      NUMBER(38, 0)    NOT NULL,
    actividad_prod_desc    VARCHAR2(300)    NOT NULL
)
TABLESPACE users;

-- TABLE: ARTICULO 
CREATE TABLE ARTICULO(
    articulo_id           NUMBER(10, 0)    NOT NULL,
    nombre                VARCHAR2(50)     NOT NULL,
    descripcion           VARCHAR2(300),
    precio_venta_inicial         NUMBER(10, 2)    NOT NULL,
    codigo_barras         char(10)    NOT NULL,
    fotografia_1          BLOB             ,
    fotografia_2          BLOB,
    fecha_status               DATE             NOT NULL,
    discrimimante         NUMBER(1, 0)     NOT NULL,
    status_articulo    NUMBER(10, 0)    NOT NULL,
    cliente_id            NUMBER(10, 0)
)
TABLESPACE users
partition by range (articulo_id) (
partition articulo_p1 values less than (1500),
partition articulo_p2 values less than (3000),
partition articulo_pn values less than (maxvalue))
;
-- TABLE: BANCO 
CREATE TABLE BANCO(
    banco_id             NUMBER(10, 0)    NOT NULL,
    banco_descripcion    VARCHAR2(100)
)
TABLESPACE users;

-- TABLE: CASA 
CREATE TABLE CASA(
    articulo_id    NUMBER(10, 0)    NOT NULL,
    latitud        CHAR(15)         NOT NULL,
    longitud       CHAR(15)         NOT NULL,
    direccion      VARCHAR2(300)    NOT NULL,
    descripcion    VARCHAR2(300 )    NOT NULL
)
TABLESPACE users;


-- TABLE: CLIENTE 
CREATE TABLE CLIENTE(
    cliente_id            NUMBER(10, 0)    NOT NULL,
    aval                  NUMBER(10, 0),
    nombre                VARCHAR2(50)     NOT NULL,
    ap_paterno            VARCHAR2(50)     NOT NULL,
    ap_materno            VARCHAR2(50),
    correo_electronico    VARCHAR2(50)     NOT NULL,
    foto_perfil           BLOB             ,
    resenia               VARCHAR2(500)     NOT NULL,
    usuario               VARCHAR2(50)     NOT NULL,
    RFC                   CHAR(13)         NOT NULL,
    CLABE                 CHAR(18),
    tarjeta               CHAR(16),
    mes_expiracion        CHAR(2),
    anio_expiracion       CHAR(4),
    banco_id              NUMBER(10, 0)    NOT NULL,
    estado_id             NUMBER(10, 0)
)
TABLESPACE users;

-- TABLE: CLIENTE_SUBASTA 
CREATE TABLE CLIENTE_SUBASTA(
    cliente_id         NUMBER(10, 0)    NOT NULL,
    subasta_bien_id    NUMBER(10, 0)    NOT NULL,
    numero_oferta      NUMBER(10, 2)    NOT NULL,
    hora_oferta        TIMESTAMP(6)     NOT NULL,
    oferta             BINARY_DOUBLE    NOT NULL
)
TABLESPACE users;

-- TABLE: descripcion_factura 
CREATE TABLE descripcion_factura(
    descripcon_factura_id    NUMBER(38, 0)    NOT NULL,
    subasta_bien_id          NUMBER(10, 0)    NOT NULL,
    factura_id               NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: ESTADO 
CREATE TABLE ESTADO(
    estado_id             NUMBER(10, 0)    NOT NULL,
    estado_descripcion    VARCHAR2(100)    NOT NULL,
    pais_id               NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: FACTURA 
CREATE TABLE FACTURA(
    factura_id            NUMBER(10, 0)    NOT NULL,
    fecha_generacion      TIMESTAMP(6)     NOT NULL,
    monto_total_compra    BINARY_DOUBLE    NOT NULL,
    iva                   BINARY_DOUBLE    NOT NULL,
    cliente_id            NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: HACIENDA 
CREATE TABLE HACIENDA(
    articulo_id        NUMBER(10, 0)    NOT NULL,
    extension_km2      NUMBER(10, 2)    NOT NULL,
    direccion          VARCHAR2(50)
)
TABLESPACE users;

-- TABLE: HACIENDA_ACTIVIDAD 
CREATE TABLE HACIENDA_ACTIVIDAD(
    actividad_prod_id    NUMBER(38, 0)    NOT NULL,
    articulo_id          NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: HISTORICO_STATUS_ARTICULO 
CREATE TABLE HISTORICO_STATUS_ARTICULO(
    HISTORICO_STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                    DATE             NOT NULL,
    status_articulo_id              NUMBER(10, 0)    NOT NULL,
    articulo_id                     NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: MARCA_AUTO 
CREATE TABLE MARCA_AUTO(
    marca_id             NUMBER(10, 0)    NOT NULL,
    MARCA_DESCRIPCION    VARCHAR2(100)     NOT NULL
)
TABLESPACE users;

-- TABLE: MODELO_AUTO 
CREATE TABLE MODELO_AUTO(
    modelo_id             NUMBER(10, 0)    NOT NULL,
    modelo_descripcion    VARCHAR2(100)     NOT NULL,
    marca_id              NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: PAIS 
CREATE TABLE PAIS(
    pais_id             NUMBER(10, 0)    NOT NULL,
    pais_descripcion    VARCHAR2(100)         NOT NULL,
    NOMBRE              VARCHAR2(50)
)
TABLESPACE users;

-- TABLE: STATUS_ARTICULO 
CREATE TABLE STATUS_ARTICULO(
    status_articulo_id    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION           VARCHAR2(100),
    clave                 VARCHAR2(100)
)
TABLESPACE users;

-- TABLE: SUBASTA 
CREATE TABLE SUBASTA(
    subasta_id                 NUMBER(10, 0)    NOT NULL,
    cifra_total_recaudada      BINARY_DOUBLE,
    direccion_web              VARCHAR2(50)     NOT NULL,
    cifra_esperada_recaudar    BINARY_DOUBLE    NOT NULL
)
TABLESPACE users;

-- TABLE: SUBASTA_BIEN 
CREATE TABLE SUBASTA_BIEN(
    subasta_bien_id    NUMBER(10, 0)    NOT NULL,
    CIFRA_RECAUDADA    NUMBER(10, 0),
    FECHA_SUBASTA      DATE,
    subasta_id         NUMBER(10, 0)    NOT NULL,
    articulo_id        NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;

-- TABLE: VEHICULO 
CREATE TABLE VEHICULO(
    articulo_id         NUMBER(10, 0)    NOT NULL,
    anio                CHAR(4)          NOT NULL,
    numero_cilindros    CHAR(4)          NOT NULL,
    numero_serie        VARCHAR2(50)     NOT NULL,
    modelo_id           NUMBER(10, 0)    NOT NULL
)
TABLESPACE users;


--Indices para tabla articulo
CREATE INDEX articulo_articulo_id_pk ON ARTICULO(articulo_id)
TABLESPACE indx_tbs;
CREATE INDEX articulo_sai_fk ON ARTICULO(status_articulo)
TABLESPACE indx_tbs;
CREATE INDEX articulo_cliente_id_fk ON ARTICULO(cliente_id)
TABLESPACE indx_tbs;


ALTER TABLE ARTICULO 
    ADD CONSTRAINT cpk_articulo_articulo_id_pk
    PRIMARY KEY (articulo_id) USING INDEX articulo_articulo_id_pk;


--Indice para tabla actividad
CREATE INDEX actividad_api_pk ON ACTIVIDAD(actividad_prod_id)
TABLESPACE indx_tbs;

ALTER TABLE ACTIVIDAD
    ADD CONSTRAINT cpk_actividad_api_pk
    PRIMARY KEY (actividad_prod_id) USING INDEX actividad_api_pk;

--Indice para tabla banco
CREATE INDEX banco_banco_id_pk ON BANCO(banco_id)
TABLESPACE indx_tbs;

ALTER TABLE BANCO
    ADD CONSTRAINT cpk_banco_banco_id_pk
    PRIMARY KEY (banco_id) USING INDEX banco_banco_id_pk;


--Indices para tabla cliente
CREATE INDEX cliente_banco_id_pk ON CLIENTE(cliente_id)
TABLESPACE indx_tbs;
CREATE INDEX cliente_estadi_id_fk ON CLIENTE(estado_id)
TABLESPACE indx_tbs;
CREATE INDEX cliente_ava_fk ON CLIENTE(aval)
TABLESPACE indx_tbs;
CREATE INDEX cliente_banco_id_fk ON CLIENTE(banco_id)
TABLESPACE indx_tbs;

ALTER TABLE CLIENTE
    ADD CONSTRAINT cpk_cliente_banco_id_pk
    PRIMARY KEY (cliente_id) USING INDEX cliente_banco_id_pk;


--Indices para tabla cliente_subasta
CREATE INDEX cs_ci_sbi_pk ON CLIENTE_SUBASTA(cliente_id, subasta_bien_id)
TABLESPACE indx_tbs;

ALTER TABLE CLIENTE_SUBASTA
    ADD CONSTRAINT cpk_cs_ci_sbi_pk
    PRIMARY KEY (cliente_id, subasta_bien_id) USING INDEX cs_ci_sbi_pk;


CREATE INDEX cs_ci_fk ON CLIENTE_SUBASTA(cliente_id)
TABLESPACE indx_tbs;


CREATE INDEX cs_sbi_fk ON CLIENTE_SUBASTA(subasta_bien_id)
TABLESPACE indx_tbs;


--Indices para tabla descripcion_factura
CREATE INDEX df_dfi_pk ON descripcion_factura(descripcon_factura_id)
TABLESPACE indx_tbs;

ALTER TABLE descripcion_factura
    ADD CONSTRAINT cpk_df_dfi_pk
    PRIMARY KEY (descripcon_factura_id) USING INDEX df_dfi_pk;

CREATE INDEX df_sbi_fk ON descripcion_factura(subasta_bien_id)
TABLESPACE indx_tbs;

CREATE INDEX df_factura_id_fk ON descripcion_factura(factura_id)
TABLESPACE indx_tbs;


--Indices para tabla estado
CREATE INDEX estado_estado ON ESTADO(estado_id)
TABLESPACE indx_tbs;

ALTER TABLE ESTADO
    ADD CONSTRAINT cpk_estado_estado
    PRIMARY KEY (estado_id) USING INDEX estado_estado;


CREATE INDEX estado_pais_id_fk ON ESTADO(pais_id)
TABLESPACE indx_tbs;

--Indices para tabla factur
CREATE INDEX factura_id_pk ON FACTURA(factura_id)
TABLESPACE indx_tbs;

ALTER TABLE FACTURA
    ADD CONSTRAINT pk_factura_factura_id_pk
    PRIMARY KEY (factura_id) USING INDEX factura_id_pk;


CREATE INDEX factura_cliente_id_fk ON FACTURA(cliente_id)
TABLESPACE indx_tbs;

--Indices para tabla hacienda
CREATE INDEX hacienda_articulo_id_pk ON HACIENDA(articulo_id)
TABLESPACE indx_tbs;

ALTER TABLE HACIENDA
    ADD CONSTRAINT cpk_hacienda_articulo_id_pk
    PRIMARY KEY (articulo_id) USING INDEX hacienda_articulo_id_pk;

CREATE INDEX hacienda_articulo_id_fk ON HACIENDA(articulo_id)
TABLESPACE indx_tbs;

--Indices para tabla hacienda_actividad
CREATE INDEX ha_api_ai_pk ON HACIENDA_ACTIVIDAD(actividad_prod_id, articulo_id)
TABLESPACE indx_tbs;

ALTER TABLE HACIENDA_ACTIVIDAD
    ADD CONSTRAINT cpk_ha_api_ai_pk
    PRIMARY KEY (actividad_prod_id, articulo_id) USING INDEX ha_api_ai_pk;


CREATE INDEX ha_api_fk ON HACIENDA_ACTIVIDAD(actividad_prod_id)
TABLESPACE indx_tbs;
CREATE INDEX ha_ai_fk ON HACIENDA_ACTIVIDAD(articulo_id)
TABLESPACE indx_tbs;

--Indices para tabla historico_status_articulo
CREATE INDEX  hsa_hsai_pk ON HISTORICO_STATUS_ARTICULO(HISTORICO_STATUS_ARTICULO_ID)
TABLESPACE indx_tbs;

ALTER TABLE HISTORICO_STATUS_ARTICULO
    ADD CONSTRAINT cpk_hsa_hsai_pk
    PRIMARY KEY (HISTORICO_STATUS_ARTICULO_ID) USING INDEX hsa_hsai_pk;


CREATE INDEX hsa_sai_fk ON HISTORICO_STATUS_ARTICULO(status_articulo_id)
TABLESPACE indx_tbs;
CREATE INDEX hsa_articulo_id_fk ON HISTORICO_STATUS_ARTICULO(articulo_id)
TABLESPACE indx_tbs;

--Indices para tabla marca_auto
CREATE INDEX mau_marca_id_pk ON MARCA_AUTO(marca_id)
TABLESPACE indx_tbs;

ALTER TABLE MARCA_AUTO
    ADD CONSTRAINT cpk_mau_marca_id_pk
    PRIMARY KEY (marca_id) USING INDEX mau_marca_id_pk;


--Indices para tabla modelo_auto
CREATE INDEX ma_modelo_id_pk ON MODELO_AUTO(modelo_id)
TABLESPACE indx_tbs;

ALTER TABLE MODELO_AUTO
    ADD CONSTRAINT cpk_ma_modelo_id_pk
    PRIMARY KEY (modelo_id) USING INDEX ma_modelo_id_pk;



CREATE INDEX ma_marca_id_fk ON MODELO_AUTO(marca_id)
TABLESPACE indx_tbs;

--Indice para tabla pais
CREATE INDEX pais_pais_id_pk ON PAIS(pais_id)
TABLESPACE indx_tbs;

ALTER TABLE PAIS
    ADD CONSTRAINT cpk_pais_pais_id_pk
    PRIMARY KEY (pais_id) USING INDEX pais_pais_id_pk;


--Indice para tabla status_articulo
CREATE INDEX sa_sai_pk ON STATUS_ARTICULO(status_articulo_id)
TABLESPACE indx_tbs;

ALTER TABLE STATUS_ARTICULO
    ADD CONSTRAINT cpk_sa_sai_pk
    PRIMARY KEY (status_articulo_id) USING INDEX sa_sai_pk;


--Indice para tabla subasta
CREATE INDEX subasta_subasta_id_pk ON SUBASTA(subasta_id)
TABLESPACE indx_tbs;

ALTER TABLE SUBASTA
    ADD CONSTRAINT cpk_subasta_subasta_id_pk
    PRIMARY KEY (subasta_id) USING INDEX subasta_subasta_id_pk;


--Indice para tabla subasta_bien
CREATE INDEX sb_sbi_pk ON SUBASTA_BIEN(subasta_bien_id)
TABLESPACE indx_tbs;

ALTER TABLE SUBASTA_BIEN
    ADD CONSTRAINT cpk_sb_sbi_pk
    PRIMARY KEY (subasta_bien_id) USING INDEX sb_sbi_pk;


CREATE INDEX sb_si_fk ON SUBASTA_BIEN(subasta_id)
TABLESPACE indx_tbs;
CREATE INDEX sb_articulo_id_fk ON SUBASTA_BIEN(articulo_id)
TABLESPACE indx_tbs;

--Indice para tabla vehiculo
CREATE INDEX vehiculo_articulo_id_pk ON VEHICULO(articulo_id)
TABLESPACE indx_tbs;

ALTER TABLE VEHICULO
    ADD CONSTRAINT cpk_vehiculo_articulo_id_pk
    PRIMARY KEY (articulo_id) USING INDEX vehiculo_articulo_id_pk;


CREATE INDEX vehiculo_articulo_id_fk ON VEHICULO(articulo_id)
TABLESPACE indx_tbs;

CREATE INDEX vehiculo_modelo_id_fk ON VEHICULO(modelo_id)
TABLESPACE indx_tbs;

--Indices para tabla casa
CREATE INDEX casa_articulo_id_pk ON CASA(articulo_id)
TABLESPACE indx_tbs;

ALTER TABLE CASA
    ADD CONSTRAINT cpk_casa_articulo_id_pk
    PRIMARY KEY (articulo_id) USING INDEX casa_articulo_id_pk;


CREATE INDEX casa_articulo_id_fk ON CASA(articulo_id)
TABLESPACE indx_tbs;

 


 ALTER TABLE ARTICULO ADD CONSTRAINT RefCLIENTE26 
    FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE(cliente_id)
;

ALTER TABLE ARTICULO ADD CONSTRAINT RefSTATUS_ARTICULO21 
    FOREIGN KEY (status_articulo_id)
    REFERENCES STATUS_ARTICULO(status_articulo_id)
;


-- 
-- TABLE: CASA 
--

ALTER TABLE CASA ADD CONSTRAINT RefARTICULO40 
    FOREIGN KEY (articulo_id)
    REFERENCES ARTICULO(articulo_id)
;


-- 
-- TABLE: CLIENTE 
--

ALTER TABLE CLIENTE ADD CONSTRAINT RefCLIENTE27 
    FOREIGN KEY (aval)
    REFERENCES CLIENTE(cliente_id)
;

ALTER TABLE CLIENTE ADD CONSTRAINT RefBANCO12 
    FOREIGN KEY (banco_id)
    REFERENCES BANCO(banco_id)
;

ALTER TABLE CLIENTE ADD CONSTRAINT RefESTADO14 
    FOREIGN KEY (estado_id)
    REFERENCES ESTADO(estado_id)
;


-- 
-- TABLE: CLIENTE_SUBASTA 
--

ALTER TABLE CLIENTE_SUBASTA ADD CONSTRAINT RefCLIENTE25 
    FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE(cliente_id)
;

ALTER TABLE CLIENTE_SUBASTA ADD CONSTRAINT RefSUBASTA_BIEN29 
    FOREIGN KEY (subasta_bien_id)
    REFERENCES SUBASTA_BIEN(subasta_bien_id)
;


-- 
-- TABLE: descripcion_factura 
--

ALTER TABLE descripcion_factura ADD CONSTRAINT RefSUBASTA_BIEN41 
    FOREIGN KEY (subasta_bien_id)
    REFERENCES SUBASTA_BIEN(subasta_bien_id)
;

ALTER TABLE descripcion_factura ADD CONSTRAINT RefFACTURA43 
    FOREIGN KEY (factura_id)
    REFERENCES FACTURA(factura_id)
;


-- 
-- TABLE: ESTADO 
--

ALTER TABLE ESTADO ADD CONSTRAINT RefPAIS13 
    FOREIGN KEY (pais_id)
    REFERENCES PAIS(pais_id)
;


-- 
-- TABLE: FACTURA 
--

ALTER TABLE FACTURA ADD CONSTRAINT RefCLIENTE37 
    FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE(cliente_id)
;


-- 
-- TABLE: HACIENDA 
--

ALTER TABLE HACIENDA ADD CONSTRAINT RefARTICULO39 
    FOREIGN KEY (articulo_id)
    REFERENCES ARTICULO(articulo_id)
;


-- 
-- TABLE: HACIENDA_ACTIVIDAD 
--

ALTER TABLE HACIENDA_ACTIVIDAD ADD CONSTRAINT RefACTIVIDAD8 
    FOREIGN KEY (actividad_prod_id)
    REFERENCES ACTIVIDAD(actividad_prod_id)
;

ALTER TABLE HACIENDA_ACTIVIDAD ADD CONSTRAINT RefHACIENDA9 
    FOREIGN KEY (articulo_id)
    REFERENCES HACIENDA(articulo_id)
;


-- 
-- TABLE: HISTORICO_STATUS_ARTICULO 
--

ALTER TABLE HISTORICO_STATUS_ARTICULO ADD CONSTRAINT RefSTATUS_ARTICULO22 
    FOREIGN KEY (status_articulo_id)
    REFERENCES STATUS_ARTICULO(status_articulo_id)
;

ALTER TABLE HISTORICO_STATUS_ARTICULO ADD CONSTRAINT RefARTICULO23 
    FOREIGN KEY (articulo_id)
    REFERENCES ARTICULO(articulo_id)
;


-- 
-- TABLE: MODELO_AUTO 
--

ALTER TABLE MODELO_AUTO ADD CONSTRAINT RefMARCA_AUTO4 
    FOREIGN KEY (marca_id)
    REFERENCES MARCA_AUTO(marca_id)
;


-- 
-- TABLE: SUBASTA_BIEN 
--

ALTER TABLE SUBASTA_BIEN ADD CONSTRAINT RefSUBASTA32 
    FOREIGN KEY (subasta_id)
    REFERENCES SUBASTA(subasta_id)
;

ALTER TABLE SUBASTA_BIEN ADD CONSTRAINT RefARTICULO34 
    FOREIGN KEY (articulo_id)
    REFERENCES ARTICULO(articulo_id)
;


-- 
-- TABLE: VEHICULO 
--

ALTER TABLE VEHICULO ADD CONSTRAINT RefARTICULO38 
    FOREIGN KEY (articulo_id)
    REFERENCES ARTICULO(articulo_id)
;

ALTER TABLE VEHICULO ADD CONSTRAINT RefMODELO_AUTO6 
    FOREIGN KEY (modelo_id)
    REFERENCES MODELO_AUTO(modelo_id)
;


