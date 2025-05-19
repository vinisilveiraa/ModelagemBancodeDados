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
	prod_categoria VARCHAR(255) NOT NULL,
	prod_catcodigo INT PRIMARY KEY,
);

#==================================
#Inserindo dados nas tabelas
#DML - Data ManipulationLanguage

#INSERT
INSERT INTO cliente (cli_cpf,cli_nome,cli_rua,cli_numero,cli_bairro,cli_telefone)
VALUES      (11111111111,"joao da silva","rua tal",100,"nova europa","14999999999");

SELECT * FROM cliente;

#===================================
#Criação tabela produto

CREATE TABLE produto(
	prod_codigo INT PRIMARY KEY AUTO_INCREMENT,
	prod_nome VARCHAR(255) NOT NULL UNIQUE,
	fk_prod_categoria INT NOT NULL,
	prod_preco DECIMAL(5,2) NOT NULL
);

ALTER TABLE produto 
ADD CONSTRAINT fk_categoria 
FOREIGN KEY (fk_prod_categoria) 
REFERENCES produto(prod_codigo);

SELECT * FROM categoria;

#Criação tabela pedido

CREATE TABLE pedido (
	ped_numero INT PRIMARY KEY AUTO_INCREMENT,
	ped_data DATE NOT NULL,
	fk_ped_cliente VARCHAR(11) NOT NULL
);

#Criação tabela pedido_produto

CREATE TABLE pedido_produto(
	fk_pedido INT NOT NULL,
	fk_produto INT NOT NULL,
);

ALTER TABLE pedido_produto
ADD CONSTRAINT fk_ped 
FOREIGN KEY (fk_pedido) 
REFERENCES pedido(ped_numero);

ALTER TABLE pedido_produto
ADD CONSTRAINT fk_prod
FOREIGN KEY (fk_produto) 
REFERENCES produto(prod_codigo);

DROP TABLE produto;

DESCRIBE produto;

INSERT
INTO produto (prod_nome,fk_prod_categoria,prod_preco)
VALUE ("camiseta X",1,100.00);

INSERT
INTO produto (prod_nome,fk_prod_categoria,prod_preco)
VALUE ("Bermuda X",1,100.00);

INSERT
INTO pedido (ped_data, fk_ped_cliente)
VALUE ("2025-05-19","1");

SELECT * FROM pedido;