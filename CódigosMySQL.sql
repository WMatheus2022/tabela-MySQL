CREATE DATABASE ESCOLA;

USE ESCOLA;

CREATE TABLE aluno (
    id_aluno INTEGER PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(30) NOT NULL, 
    endereco VARCHAR(30) NOT NULL
)


INSERT INTO aluno (id_aluno, nome, email, endereco) VALUES (1, 'João Silva', 'joao@email.com', 'Rua da Escola, 123');
INSERT INTO aluno (id_aluno, nome, email, endereco) VALUES (2, 'Maria Santos', 'maria@email.com', 'Avenida Principal, 456');
INSERT INTO aluno (id_aluno, nome, email, endereco) VALUES (3, 'Carlos Mendes', 'carlos@email.com', 'Travessa das Flores, 789');

SELECT * FROM ESCOLA.aluno;





