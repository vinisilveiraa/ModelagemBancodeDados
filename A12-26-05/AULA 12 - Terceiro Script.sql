#ATUALIZADO EM: 19/05/2025

#SINTAXE INICIAL PARA INTERAGIR COM O BANCO DE DADOS

#MOSTRA A VERSÃO DO BANCO DE DADOS
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

#----------------------------------------------------------------------------------------------------
/* 
	DDL - DATA DEFINITION LANGUAGE

	CRIANDO E MANIPULANDO TABELAS

*/

#CRIANDO DA TABELA CLIENTE
CREATE TABLE cliente(
	cli_cpf VARCHAR(11) PRIMARY KEY,
	cli_nome VARCHAR(255) NOT NULL,
	cli_rua VARCHAR(255) NOT NULL,
	cli_numero INT NOT NULL,
	cli_bairro VARCHAR(255) NOT NULL,
	cli_telefone VARCHAR(11) NOT NULL
);

#CRIACAO TABELA CATEGORIA
CREATE TABLE categoria(
	prod_catcodigo INT PRIMARY KEY AUTO_INCREMENT,
	prod_catnome VARCHAR(255) NOT NULL UNIQUE
);

#CRIACAO DA TABELA PRODUTO
CREATE TABLE produto(
	prod_codigo INT PRIMARY KEY AUTO_INCREMENT,
	prod_nome VARCHAR(255) NOT NULL UNIQUE,
	fk_prod_categoria INT NOT NULL,
	prod_preco DECIMAL(5,2) NOT NULL	
);
ALTER TABLE produto 
ADD CONSTRAINT fk_categoria 
FOREIGN KEY (fk_prod_categoria) 
REFERENCES categoria(prod_catcodigo);

#CRIACAO DA TABELA PEDIDO
CREATE TABLE pedido(
	ped_numero INT PRIMARY KEY AUTO_INCREMENT,
	ped_data DATE NOT NULL,
	fk_ped_cliente VARCHAR(11) NOT NULL
);
ALTER TABLE pedido 
ADD CONSTRAINT fk_cliente 
FOREIGN KEY (fk_ped_cliente) 
REFERENCES cliente(cli_cpf);


#CRIACAO DA TABELA PEDIDO_PRODUTO
CREATE TABLE pedido_produto(
	fk_pedido INT NOT NULL,
	fk_produto INT NOT NULL
); 
ALTER TABLE pedido_produto  
ADD CONSTRAINT fk_ped 
FOREIGN KEY (fk_pedido) 
REFERENCES pedido(ped_numero);

ALTER TABLE pedido_produto  
ADD CONSTRAINT fk_prod 
FOREIGN KEY (fk_produto) 
REFERENCES produto(prod_codigo);




#-----------------------------------------------------------------------------------------------------

#Extra para interagir com as tabelas do banco

#MOSTRA AS CARACTERÍSTICAS DOS ATRIBUTOS DA TABELA
DESCRIBE cliente;

#APAGA UMA TABELA
#CUIDADO! APAGA AS TABELAS E SEUS DADOS CASO JÁ EXISTAM
DROP TABLE cliente;

------------------------------------------------
/*

	DML - Data Manipulation Language
	MANIPULANDO OS DADOS EM TABELAS
	CRIAR, SELECIONAR, ATUALIZAR E APAGAR
	
	CRUD: CREATE, SELECT, UPDATE E DELETE

*/

/*

	Inserindo dados nas tabelas

	INSERT
	
	SINTAXE: INSERT INTO nome_tabela (atributo1, atributo2) values (valor, valor2)

*/

#Inserindo dado de um cliente
INSERT 
INTO cliente (cli_cpf,cli_nome, cli_rua, cli_numero,cli_bairro, cli_telefone) 
VALUES (20558965498,"João da Silva", "Rua Amaral Gurgel",100,"Centro", "14999995454");

#Inserindo dados de categorias
INSERT
INTO categoria (prod_catnome) VALUES ("Bermuda");

#Inserindo produto
INSERT
INTO produto (prod_nome,fk_prod_categoria, prod_preco)
VALUES ("Bermuda X", 1,100.00);

#Inser

#Selecionando dados das tabelas

#SELECT
#SINTAXE (Seleciona todos os dados da tabela)
SELECT * FROM nome_tabela;

#SINTAXE (Seleciona alguns atributos da tabela)
SELECT atributo1,atributo2 FROM nome_tabela;







