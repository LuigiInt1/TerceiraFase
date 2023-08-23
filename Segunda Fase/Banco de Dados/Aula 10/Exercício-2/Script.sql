DROP DATABASE IF EXISTS DBELEICAO;

CREATE DATABASE DBELEICAO;

USE DBELEICAO;

CREATE TABLE PARTIDO(
	IDPARTIDO INT PRIMARY KEY,
	NOME VARCHAR(255),
	SIGLA VARCHAR(10)
);

CREATE TABLE CANDIDATO(
	IDCANDIDADTO INT NOT NULL,
	IDPARTIDO INT, 
	NOME VARCHAR(255),
	RUA VARCHAR(100),
	CEP VARCHAR(8),
	CIDADE VARCHAR(100),
	ESTADO CHAR(2),
	FOREIGN KEY (IDPARTIDO) REFERENCES PARTIDO(IDPARTIDO)
);

CREATE TABLE DEPARTAMENTO (
IDDEPARTAMENTO INT NOT NULL,
NOME VARCHAR(100),
PRIMARY KEY (IDDEPARTAMENTO)
);

CREATE TABLE ELEICAO (
	IDELEICAO INT NOT NULL,
	TITULO VARCHAR(100),
	DT_INICIO DATETIME,
	DT_FIM DATETIME,
	PRIMARY KEY (IDELEICAO)
);

CREATE TABLE CHAPA(
IDCHAPA INT NOT NULL,
IDELEICAO INT NOT NULL, 
FOREIGN KEY (IDELEICAO) REFERENCES ELEICAO (IDELEICAO),
NOME VARCHAR(100),
PRIMARY KEY (IDCHAPA)
);

CREATE TABLE FUNCIONARIO (
	FUNCIONARIO INT PRIMARY KEY,
	IDPARTIDO INT NOT NULL,
	DESCRICAO VARCHAR (100)
);
CREATE TABLE VOTAR(
	IDELEICAO INT PRIMARY KEY,
	IDUSUARIO INT,
	IDCANDIDATO INT,
	DT_VOTO DATETIME
);


CREATE TABLE USUARIO (
  LOGIN VARCHAR(100),
  SENHA VARCHAR(255),
  EMAIL VARCHAR(100)
);

CREATE TABLE SETOR(
	IDSETOR INT NOT NULL,
	NOME VARCHAR(100)
);

CREATE TABLE FUNCAO(
	DESCRICAO VARCHAR(100)
);

CREATE TABLE CARGO (
IDCARGO INT NOT NULL,
DESCRICAO VARCHAR (100),
PRIMARY KEY(IDCARGO)
);

CREATE TABLE PARTICIPA(
	IDFUNCAO INT,
	IDUSUARIO INT
);



DROP TABLE CANDIDATO;

DROP TABLE PARTIDO;

ALTER TABLE FUNCIONARIO
CHANGE FUNCIONARIO IDFUNCIONARIO INT,
ADD COLUMN IDDEPARTAMENTO INT NOT NULL,
ADD foreign key (IDDEPARTAMENTO) REFERENCES DEPARTAMENTO (IDDEPARTAMENTO),
CHANGE DESCRICAO NOME VARCHAR(100) NOT NULL,
ADD column CPF CHAR(11) NOT NULL,
ADD COLUMN SENHA VARCHAR(45);

DROP TABLE USUARIO;

DROP TABLE SETOR;
DROP TABLE FUNCAO;


ALTER TABLE VOTAR
DROP column IDUSUARIO,
DROP column IDCANDIDATO,
DROP primary key ,
DROP column DT_VOTO,
ADD COLUMN IDCHAPA INT NOT NULL,
ADD COLUMN IDFUNCIONARIO INT NOT NULL,
ADD PRIMARY KEY (IDELEICAO, IDFUNCIONARIO),
ADD FOREIGN KEY (IDELEICAO) references ELEICAO (IDELEICAO),
ADD FOREIGN KEY (IDFUNCIONARIO) references FUNCIONARIO(IDFUNCIONARIO),
ADD FOREIGN KEY (IDCHAPA) references CHAPA(IDCHAPA),
ADD COLUMN DT_VOTO INT NOT NULL;


ALTER TABLE PARTICIPA
ADD COLUMN IDFUNCIONARIO INT NOT NULL,
ADD COLUMN IDCHAPA INT NOT NULL,
ADD PRIMARY KEY (IDFUNCIONARIO, IDCHAPA),
ADD FOREIGN KEY (IDFUNCIONARIO) references FUNCIONARIO(IDFUNCIONARIO),
ADD FOREIGN KEY (IDCHAPA) references CHAPA(IDCHAPA),
ADD COLUMN IDCARGO INT NOT NULL,
ADD FOREIGN KEY (IDCARGO) references CARGO(IDCARGO);







