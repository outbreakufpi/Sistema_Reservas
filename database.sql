-- Criar banco de dados
CREATE DATABASE sistema_reservas;

-- Conectar ao banco de dados
\c sistema_reservas;

-- Criar tabela de usuários
CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    matricula VARCHAR(20) UNIQUE NOT NULL,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(100) NOT NULL,
    tipo_usuario VARCHAR(20) NOT NULL DEFAULT 'usuario'
);

-- Criar tabela de salas
CREATE TABLE salas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    capacidade INTEGER NOT NULL,
    recursos TEXT[],
    status VARCHAR(20) NOT NULL DEFAULT 'disponivel'
);

-- Criar tabela de reservas
CREATE TABLE reservas (
    id SERIAL PRIMARY KEY,
    sala_id INTEGER REFERENCES salas(id),
    usuario_id INTEGER REFERENCES usuarios(id),
    data_inicio TIMESTAMP NOT NULL,
    data_fim TIMESTAMP NOT NULL,
    motivo TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'pendente'
);

-- Inserir usuário admin
INSERT INTO usuarios (matricula, nome, email, senha, tipo_usuario)
VALUES ('admin', 'Administrador', 'admin@sistema.com', '$2a$10$ruY97xh9/wjTWQmbhfmwNuBIixYi2FWFbztIgrAG6qAmogW51D7Pu', 'admin'); 