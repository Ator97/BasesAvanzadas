--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      None
-- Project :      subastas_v1.dm1
-- Author :       Oscar
--
-- Date Created : Wednesday, December 04, 2019 17:47:52
-- Target DBMS : Oracle 11g
--

DROP IF EXISTS TABLE ACTIVIDAD CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE ARTICULO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE BANCO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE CASA CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE CLIENTE CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE CLIENTE_SUBASTA CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE descripcion_factura CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE ESTADO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE FACTURA CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE HACIENDA CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE HACIENDA_ACTIVIDAD CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE HISTORICO_STATUS_ARTICULO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE MARCA_AUTO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE MODELO_AUTO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE PAIS CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE STATUS_ARTICULO CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE SUBASTA CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE SUBASTA_BIEN CASCADE CONSTRAINTS;
DROP IF EXISTS TABLE VEHICULO CASCADE CONSTRAINTS;


-- 
-- TABLE: ACTIVIDAD 
--

CREATE TABLE ACTIVIDAD(
    actividad_prod_id      NUMBER(38, 0)    NOT NULL,
    actividad_prod_desc    VARCHAR2(150)    NOT NULL,
    CONSTRAINT actividad_api_pk PRIMARY KEY (actividad_prod_id)
)
TABLESPACE users;

-- 
-- TABLE: ARTICULO 
--

CREATE TABLE ARTICULO(
    articulo_id           NUMBER(10, 0)    NOT NULL,
    nombre                VARCHAR2(50)     NOT NULL,
    descripcion           VARCHAR2(50),
    precio_venta          NUMBER(10, 2)    NOT NULL,
    codigo_barras         NUMBER(10, 2)    NOT NULL,
    fotografia_1          BLOB             NOT NULL,
    fotografia_2          BLOB,
    vendido               DATE             NOT NULL,
    discrimimante         NUMBER(1, 0)     NOT NULL,
    status_articulo_id    NUMBER(10, 0)    NOT NULL,
    cliente_id            NUMBER(10, 0),
    CONSTRAINT articulo_articulo_id_pk PRIMARY KEY (articulo_id)
)
TABLESPACE users;

-- 
-- TABLE: BANCO 
--

CREATE TABLE BANCO(
    banco_id             NUMBER(10, 0)    NOT NULL,
    banco_descripcion    VARCHAR2(45),
    CONSTRAINT banco_banco_id_pk PRIMARY KEY (banco_id)
)
TABLESPACE users;


-- 
-- TABLE: CASA 
--

CREATE TABLE CASA(
    articulo_id    NUMBER(10, 0)    NOT NULL,
    latitud        CHAR(15)         NOT NULL,
    longitud       CHAR(15)         NOT NULL,
    direccion      VARCHAR2(150)    NOT NULL,
    descripcion    VARCHAR2(10)     NOT NULL,
    CONSTRAINT casa_articulo_id_pk PRIMARY KEY (articulo_id)
)
TABLESPACE users;



-- 
-- TABLE: CLIENTE 
--

CREATE TABLE CLIENTE(
    cliente_id            NUMBER(10, 0)    NOT NULL,
    aval                  NUMBER(10, 0),
    nombre                VARCHAR2(50)     NOT NULL,
    ap_paterno            VARCHAR2(50)     NOT NULL,
    ap_materno            VARCHAR2(50),
    correo_electronico    VARCHAR2(50)     NOT NULL,
    foto_perfil           BLOB             NOT NULL,
    resenia               VARCHAR2(50)     NOT NULL,
    usuario               VARCHAR2(50)     NOT NULL,
    contrasenia           VARCHAR2(24)     NOT NULL,
    RFC                   CHAR(13)         NOT NULL,
    CLABE                 CHAR(18),
    tarjeta               CHAR(16),
    mes_expiracion        CHAR(2),
    anio_expiracion       CHAR(4),
    banco_id              NUMBER(10, 0)    NOT NULL,
    estado_id             NUMBER(10, 0),
    CONSTRAINT cliente_cliente_id_pk PRIMARY KEY (cliente_id)
)
TABLESPACE users
;



-- 
-- TABLE: CLIENTE_SUBASTA 
--

CREATE TABLE CLIENTE_SUBASTA(
    cliente_id         NUMBER(10, 0)    NOT NULL,
    subasta_bien_id    NUMBER(10, 0)    NOT NULL,
    numero_oferta      NUMBER(10, 2)    NOT NULL,
    hora_oferta        TIMESTAMP(6)     NOT NULL,
    oferta             BINARY_DOUBLE    NOT NULL,
    CONSTRAINT cs_ci_sbi_pk PRIMARY KEY (cliente_id, subasta_bien_id)
)
TABLESPACE users
;



-- 
-- TABLE: descripcion_factura 
--

CREATE TABLE descripcion_factura(
    descripcon_factura_id    NUMBER(38, 0)    NOT NULL,
    subasta_bien_id          NUMBER(10, 0)    NOT NULL,
    factura_id               NUMBER(10, 0)    NOT NULL,
    CONSTRAINT df_dfi_pk PRIMARY KEY (descripcon_factura_id)
)
TABLESPACE users
;



-- 
-- TABLE: ESTADO 
--

CREATE TABLE ESTADO(
    estado_id             NUMBER(10, 0)    NOT NULL,
    estado_descripcion    VARCHAR2(100)    NOT NULL,
    pais_id               NUMBER(10, 0)    NOT NULL,
    CONSTRAINT estdo_estado_id PRIMARY KEY (estado_id)
)
TABLESPACE users
;



-- 
-- TABLE: FACTURA 
--

CREATE TABLE FACTURA(
    factura_id            NUMBER(10, 0)    NOT NULL,
    fecha_generacion      TIMESTAMP(6)     NOT NULL,
    monto_total_compra    BINARY_DOUBLE    NOT NULL,
    iva                   BINARY_DOUBLE    NOT NULL,
    cliente_id            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT factura_factura_id_pk PRIMARY KEY (factura_id)
)
TABLESPACE users
;



-- 
-- TABLE: HACIENDA 
--

CREATE TABLE HACIENDA(
    articulo_id        NUMBER(10, 0)    NOT NULL,
    nombre_hacienda    VARCHAR2(50)     NOT NULL,
    extension_km2      NUMBER(10, 2)    NOT NULL,
    direccion          VARCHAR2(50),
    CONSTRAINT hacienda_articulo_id_pk PRIMARY KEY (articulo_id)
)
TABLESPACE users
;



-- 
-- TABLE: HACIENDA_ACTIVIDAD 
--

CREATE TABLE HACIENDA_ACTIVIDAD(
    actividad_prod_id    NUMBER(38, 0)    NOT NULL,
    articulo_id          NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ha_api_ai_pk PRIMARY KEY (actividad_prod_id, articulo_id)
)
TABLESPACE users
;



-- 
-- TABLE: HISTORICO_STATUS_ARTICULO 
--

CREATE TABLE HISTORICO_STATUS_ARTICULO(
    HISTORICO_STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_STATUS                    DATE             NOT NULL,
    status_articulo_id              NUMBER(10, 0)    NOT NULL,
    articulo_id                     NUMBER(10, 0)    NOT NULL,
    CONSTRAINT hsa_hsai_pk PRIMARY KEY (HISTORICO_STATUS_ARTICULO_ID)
)
TABLESPACE users
;



-- 
-- TABLE: MARCA_AUTO 
--

CREATE TABLE MARCA_AUTO(
    marca_id             NUMBER(10, 0)    NOT NULL,
    MARCA_DESCRIPCION    VARCHAR2(50)     NOT NULL,
    CONSTRAINT mau_marca_id_pk PRIMARY KEY (marca_id)
)
TABLESPACE users
;



-- 
-- TABLE: MODELO_AUTO 
--

CREATE TABLE MODELO_AUTO(
    modelo_id             NUMBER(10, 0)    NOT NULL,
    modelo_descripcion    VARCHAR2(50)     NOT NULL,
    marca_id              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ma_modelo_id_pk PRIMARY KEY (modelo_id)
)
TABLESPACE users
;



-- 
-- TABLE: PAIS 
--

CREATE TABLE PAIS(
    pais_id             NUMBER(10, 0)    NOT NULL,
    pais_descripcion    CHAR(10)         NOT NULL,
    NOMBRE              VARCHAR2(50),
    CONSTRAINT pais_pais_id_pk PRIMARY KEY (pais_id)
)
TABLESPACE users
;



-- 
-- TABLE: STATUS_ARTICULO 
--

CREATE TABLE STATUS_ARTICULO(
    status_articulo_id    NUMBER(10, 0)    NOT NULL,
    DESCRIPCION           VARCHAR2(50),
    clave                 VARCHAR2(50),
    CONSTRAINT sa_sai_pk PRIMARY KEY (status_articulo_id)
)
TABLESPACE users
;



-- 
-- TABLE: SUBASTA 
--

CREATE TABLE SUBASTA(
    subasta_id                 NUMBER(10, 0)    NOT NULL,
    cifra_total_recaudada      BINARY_DOUBLE,
    direccion_web              VARCHAR2(50)     NOT NULL,
    cifra_esperada_recaudar    BINARY_DOUBLE    NOT NULL,
    CONSTRAINT subasta_subasta_id_pk PRIMARY KEY (subasta_id)
)
TABLESPACE users
;



-- 
-- TABLE: SUBASTA_BIEN 
--

CREATE TABLE SUBASTA_BIEN(
    subasta_bien_id    NUMBER(10, 0)    NOT NULL,
    CIFRA_RECAUDADA    NUMBER(10, 0),
    FECHA_SUBASTA      DATE,
    subasta_id         NUMBER(10, 0)    NOT NULL,
    articulo_id        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT sb_sbi_pk PRIMARY KEY (subasta_bien_id)
)
TABLESPACE users
;



-- 
-- TABLE: VEHICULO 
--

CREATE TABLE VEHICULO(
    articulo_id         NUMBER(10, 0)    NOT NULL,
    anio                CHAR(4)          NOT NULL,
    numero_cilindros    CHAR(4)          NOT NULL,
    numero_serie        VARCHAR2(50)     NOT NULL,
    modelo_id           NUMBER(10, 0)    NOT NULL,
    CONSTRAINT vehiculo_articulo_id_pk PRIMARY KEY (articulo_id)
)
TABLESPACE users
;



-- 
-- INDEX: articulo_sai_fk 
--

CREATE INDEX articulo_sai_fk ON ARTICULO(status_articulo_id)
;
-- 
-- INDEX: articulo_cliente_id_fk 
--

CREATE INDEX articulo_cliente_id_fk ON ARTICULO(cliente_id)
;
-- 
-- INDEX: casa_articulo_id_fk 
--

CREATE INDEX casa_articulo_id_fk ON CASA(articulo_id)
;
-- 
-- INDEX: cliente_estadi_id_fk 
--

CREATE INDEX cliente_estadi_id_fk ON CLIENTE(estado_id)
;
-- 
-- INDEX: cliente_ava_fk 
--

CREATE INDEX cliente_ava_fk ON CLIENTE(aval)
;
-- 
-- INDEX: cliente_banco_id_fk 
--

CREATE INDEX cliente_banco_id_fk ON CLIENTE(banco_id)
;
-- 
-- INDEX: cs_ci_fk 
--

CREATE INDEX cs_ci_fk ON CLIENTE_SUBASTA(cliente_id)
;
-- 
-- INDEX: cs_sbi_fk 
--

CREATE INDEX cs_sbi_fk ON CLIENTE_SUBASTA(subasta_bien_id)
;
-- 
-- INDEX: df_sbi_fk 
--

CREATE INDEX df_sbi_fk ON descripcion_factura(subasta_bien_id)
;
-- 
-- INDEX: df_factura_id_fk 
--

CREATE INDEX df_factura_id_fk ON descripcion_factura(factura_id)
;
-- 
-- INDEX: estado_pais_id_fk 
--

CREATE INDEX estado_pais_id_fk ON ESTADO(pais_id)
;
-- 
-- INDEX: factura_cliente_id_fk 
--

CREATE INDEX factura_cliente_id_fk ON FACTURA(cliente_id)
;
-- 
-- INDEX: hacienda_articulo_id_fk 
--

CREATE INDEX hacienda_articulo_id_fk ON HACIENDA(articulo_id)
;
-- 
-- INDEX: ha_api_fk 
--

CREATE INDEX ha_api_fk ON HACIENDA_ACTIVIDAD(actividad_prod_id)
;
-- 
-- INDEX: ha_ai_fk 
--

CREATE INDEX ha_ai_fk ON HACIENDA_ACTIVIDAD(articulo_id)
;
-- 
-- INDEX: hsa_sai_fk 
--

CREATE INDEX hsa_sai_fk ON HISTORICO_STATUS_ARTICULO(status_articulo_id)
;
-- 
-- INDEX: hsa_articulo_id_fk 
--

CREATE INDEX hsa_articulo_id_fk ON HISTORICO_STATUS_ARTICULO(articulo_id)
;
-- 
-- INDEX: ma_marca_id_fk 
--

CREATE INDEX ma_marca_id_fk ON MODELO_AUTO(marca_id)
;
-- 
-- INDEX: sb_si_fk 
--

CREATE INDEX sb_si_fk ON SUBASTA_BIEN(subasta_id)
;
-- 
-- INDEX: sb_articulo_id_fk 
--

CREATE INDEX sb_articulo_id_fk ON SUBASTA_BIEN(articulo_id)
;
-- 
-- INDEX: vehiculo_articulo_id_fk 
--

CREATE INDEX vehiculo_articulo_id_fk ON VEHICULO(articulo_id)
;
-- 
-- INDEX: vehiculo_modelo_id_fk 
--

CREATE INDEX vehiculo_modelo_id_fk ON VEHICULO(modelo_id)
;
-- 
-- TABLE: ARTICULO 
--

ALTER TABLE ARTICULO ADD CONSTRAINT RefSTATUS_ARTICULO21 
    FOREIGN KEY (status_articulo_id)
    REFERENCES STATUS_ARTICULO(status_articulo_id)
;

ALTER TABLE ARTICULO ADD CONSTRAINT RefCLIENTE26 
    FOREIGN KEY (cliente_id)
    REFERENCES CLIENTE(cliente_id)
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

ALTER TABLE CLIENTE ADD CONSTRAINT RefESTADO14 
    FOREIGN KEY (estado_id)
    REFERENCES ESTADO(estado_id)
;

ALTER TABLE CLIENTE ADD CONSTRAINT RefCLIENTE27 
    FOREIGN KEY (aval)
    REFERENCES CLIENTE(cliente_id)
;

ALTER TABLE CLIENTE ADD CONSTRAINT RefBANCO12 
    FOREIGN KEY (banco_id)
    REFERENCES BANCO(banco_id)
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


