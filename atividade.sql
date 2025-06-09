CREATE DATABASE ATIVIDADE;

USE ATIVIDADE;

CREATE TABLE cliente(
cli_id INT PRIMARY KEY AUTO_INCREMENT,
cli_nome VARCHAR(255) NOT NULL,
cli_logradouro VARCHAR(255) NOT NULL,
cli_numero INT NOT NULL,
cli_bairro VARCHAR(255) NOT NULL,
cli_cep VARCHAR(8) NOT NULL,
cli_cidade VARCHAR(255) NOT NULL,
cli_estado VARCHAR(2) NOT NULL,
cli_telefone VARCHAR(11),
cli_email VARCHAR(255)
);

CREATE TABLE equipamento(
equi_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
equi_descricao VARCHAR(255) NOT NULL,
equi_marca VARCHAR(255) NOT NULL,
equi_ano YEAR NOT NULL,
equi_config TEXT NOT NULL,
equi_obs TEXT,
fk_cliente INT NOT NULL
);

CREATE TABLE ordem_servico(
os_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
os_data_abertura DATE NOT NULL,
os_data_fechamento DATE,
os_servicos TEXT,
fk_tecnico INT,
fk_cliente INT NOT NULL,
fk_equipamento INT NOT NULL
);

CREATE TABLE tecnico(
tec_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tec_nome VARCHAR(255),
tec_telefone VARCHAR(11)
);

CREATE TABLE item(
item_desc VARCHAR(255) NOT NULL,
item_valor DECIMAL(7,2) NOT NULL,
item_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT
);

CREATE TABLE servico(
ser_codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
ser_desc VARCHAR(255) NOT NULL, 
ser_horas DECIMAL(5,2)
ser_valor DECIMAL(6,2)
);

ALTER TABLE equipamento 
ADD CONSTRAINT fk_equipamento_cliente
FOREIGN KEY fk_cliente
REFERENCES cliente(cli_id);
#ON DELETE RESTRICT
#ON UPDATE CASCADE;