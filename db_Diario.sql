CREATE DATABASE IF NOT EXISTS db_diariobordo;

USE db_diariobordo;

show tables;

select * from tb_usuario;

CREATE TABLE tb_usuario(
cd_usuario int not null,
nm_email varchar(255),
cd_senha varchar(255),
CONSTRAINT pk_usuario
	PRIMARY KEY(cd_usuario)
);

select * from tb_usuario;
INSERT INTO tb_usuario VALUES (2, 'professor', 'senha'), (3, 'aluno', 'senha');