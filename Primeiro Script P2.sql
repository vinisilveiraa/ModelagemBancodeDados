#MOSTRA A VERSAO DO BANCO DE DADOS
SELECT VERSION();

#MOSTRA AS INSTANCIAS DE BANCOS DISPONIVEIS
SHOW DATABASES;

#CRIAR UMA INSTANCIA DE BANCO DE DADOS
CREATE DATABASE BANCO;

#APAGAR O BANCO DE DADOS
DROP DATABASE BANCO;

#CONECTAR A INSTANCIA DO BANCO DE DADOS
USE BANCO;

#MOSTRA TODAS AS TABELAS DO BANCO
SHOW TABLES;

#-------------------------------------------------------

#CRIANDO TABELAS 

#CRIANDO A TABELA CLIENTE
CREATE TABLE cliente (
	cli_cpf VARCHAR(11) PRIMARY KEY,
	cli_nome VARCHAR(255) NOT NULL,
	cli_rua VARCHAR(255) NOT NULL,
	cli_numero INT NOT NULL,
	cli_bairro VARCHAR(255) NOT NULL,
	cli_telefone VARCHAR(11) NOT NULL
	);
	
#MOSTRA OS ATRIBUTOS DA TABELA
DESCRIBE cliente;

#APAGA UMA TABELA
DROP TABLE cliente;

#==================================

CREATE TABLE categoria(
	prod_catcodigo VARCHAR(255) NOT  AUTO_INCREMENT,
	prod_catnome INT PRIMARY KEY,
);

#==================================
#Inserindo dados nas tabelas
#DML - Data ManipulationLanguage

#INSERT
INSERT INTO cliente (cli_cpf,cli_nome,cli_rua,cli_numero,cli_bairro,cli_telefone)
VALUES      (11111111111,"joao da silva","rua tal",100,"nova europa","14999999999");

SELECT * FROM cliente;

DROP TABLE categoria;