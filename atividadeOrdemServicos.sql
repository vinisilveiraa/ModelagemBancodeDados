CREATE DATABASE ATIVIDADE;

USE ATIVIDADE;

CREATE TABLE cliente(
cli_id INT PRIMARY KEY AUTO_INCREMENT,
cli_nome VARCHAR(255) NOT NULL,
cli_logradouro VARCHAR(255) NOT NULL,
cli_numero INT NOT NULL,
cli_bairro VARCHAR(255) NOT NULL,
cli_cep VARCHAR(9) NOT NULL,
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
os_data_fechamento DATE NULL,
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
ser_horas DECIMAL(5,2),
ser_valor DECIMAL(6,2)
);

ALTER TABLE equipamento 
ADD CONSTRAINT fk_equipamento_cliente
FOREIGN KEY (fk_cliente)
REFERENCES cliente(cli_id);

ALTER TABLE ordem_servico
ADD CONSTRAINT fk_ordem_cliente
FOREIGN KEY (fk_cliente)
REFERENCES cliente(cli_id);

ALTER TABLE ordem_servico
ADD CONSTRAINT fk_ordem_tecnico
FOREIGN KEY (fk_tecnico)
REFERENCES tecnico(tec_id);

ALTER TABLE ordem_servico
ADD CONSTRAINT fk_ordem_equipamento
FOREIGN KEY (fk_equipamento)
REFERENCES equipamento(equi_id);


# Manipulando tabela #

# ----TABLES---- #

#- cliente
#- equipamento
#- item
#- ordem_servico
#- servico
#- tecnico

# -------------- #

SHOW TABLES;

DESCRIBE cliente;

SELECT * FROM cliente;

SELECT * FROM equipamento WHERE fk_cliente = 1;

INSERT INTO cliente (cli_nome, cli_logradouro, cli_numero, cli_bairro, cli_cep, cli_cidade, cli_estado, cli_telefone, cli_email)
VALUES ('João Silva', 'Rua ABC', 123, 'Centro', '12345678', 'São Paulo', 'SP', '11987654321', 'joao.silva@email.com');

INSERT INTO equipamento (equi_descricao, equi_marca, equi_ano, equi_config, equi_obs, fk_cliente)
VALUES ('Computador Dell', 'Dell', 2020, 'Intel i7, 16GB RAM', 'Equipamento em bom estado', 1);

UPDATE cliente 
SET cli_telefone = '11999999999'
WHERE cli_id = 1;

DELETE FROM cliente 
WHERE cli_id = 1;


#DROP TABLE cliente;

#drop database atividade;

