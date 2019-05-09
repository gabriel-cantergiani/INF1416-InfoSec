
DROP TABLE IF EXISTS USUARIOS;

CREATE TABLE USUARIOS (

	LOGIN_NAME varchar(100) PRIMARY KEY,
	NOME varchar(60) NOT NULL,
	GRUPO integer NOT NULL,
	SALT char(10) NOT NULL,
	SENHA char(40) NOT NULL,
	CERTIFICADO_DIGITAL blob NOT NULL,
	BLOQUEADO integer,
	NUMERO_ACESSOS integer,
	NUMERO_CONSULTAS integer,
	FOREIGN KEY (GRUPO) REFERENCES GRUPOS(GID)
);


DROP TABLE IF EXISTS GRUPOS;

CREATE TABLE GRUPOS (
	NOME varchar(60) NOT NULL,
	GID integer PRIMARY KEY
);


DROP TABLE IF EXISTS REGISTROS;

CREATE TABLE REGISTROS (
	CODIGO integer PRIMARY KEY,
	DATA date NOT NULL,
	HORA time NOT NULL,
	LOGIN_NAME varchar(100),
	NOME_ARQUIVO varchar(100),
	FOREIGN KEY (LOGIN_NAME) REFERENCES USUARIOS(LOGIN_NAME)
);


DROP TABLE IF EXISTS MENSAGENS;

CREATE TABLE MENSAGENS (
	MENSAGEM varchar(100) NOT NULL,
	CODIGO integer NOT NULL,
	FOREIGN KEY (CODIGO) REFERENCES REGISTROS(CODIGO)
);
