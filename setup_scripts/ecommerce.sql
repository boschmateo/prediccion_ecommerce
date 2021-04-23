CREATE DATABASE ecommerce;

\connect ecommerce;

CREATE TABLE usuarios(
    id_usuario INTEGER,
    tipousuario TEXT,
    fecha_registro DATE,
    canal_registro INTEGER,
    ind_cliente INTEGER,
    ind_alta INTEGER,
    fecha_alta DATE,
    fecha_cliente DATE,
    tipoemail TEXT,
    bonad_email INTEGER,
    usu_telf TEXT,
    ipcasos INTEGER,
    ip_country TEXT,
    ip_region TEXT,
    usu_tipo TEXT,
    usu_tamanio TEXT,
    usu_ciiu TEXT,
    usu_estado TEXT,
    usu_departamento TEXT
);

CREATE TABLE consumos(
    id_consumo INTEGER,
    idusuario INTEGER,
    idproducto INTEGER,
    descproducto TEXT,
    idgrupoprod INTEGER,
    descgrupoprod TEXT,
    fechaconsumo TIMESTAMP,
    empconsul_id INTEGER,
    empconsul_ciiu TEXT,
    empconsul_prov TEXT,
    empconsul_est TEXT
);