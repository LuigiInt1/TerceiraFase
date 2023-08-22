DROP  DATABASE IF EXISTS DBEXERCICIO08;

CREATE DATABASE DBEXERCICIO08;

USE DBEXERCICIO08;

CREATE TABLE PESSOA_PASSAPORTE (
	IDPESSOA INT NOT NULL,
    NOME VARCHAR(45) NOT NULL,
    IDPASSAPORTE INT NOT NULL,
    NUMERO VARCHAR(45),
    PRIMARY KEY (IDPESSOA, IDPASSAPORTE)
);