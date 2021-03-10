CREATE DATABASE ecommerce;

\connect ecommerce;

CREATE TABLE usuarios(
    id_usuario INTEGER PRIMARY KEY,
    tipousuario VARCHAR(2),
    fecha_registro DATE,
    canal_registro SMALLINT,
    ind_cliente SMALLINT,
    ind_alta SMALLINT,
    fecha_alta DATE,
    fecha_cliente DATE,
    tipoemail VARCHAR(13),
    bonad_email SMALLINT,
    usu_telf VARCHAR(10),
    ipcasos INTEGER,
    ip_country VARCHAR(30),
    ip_region VARCHAR(30),
    usu_tipo VARCHAR(50),
    usu_tamanio VARCHAR(2),
    usu_ciiu VARCHAR(5),
    usu_estado VARCHAR(15),
    usu_departamento VARCHAR(30)
);

CREATE TABLE consumos(
    id_consumo INTEGER PRIMARY KEY,
    idusuario INTEGER REFERENCES usuarios,
    idproducto INTEGER,
    descproducto VARCHAR(70),
    idgrupoprod INTEGER,
    descgrupoprod VARCHAR(70),
    fechaconsumo TIMESTAMP,
    empconsul_id INTEGER,
    empconsul_ciiu VARCHAR(5),
    empconsul_prov VARCHAR(15),
    empconsul_est VARCHAR(15)
);