SELECT * FROM usuarios;

--1. Criar tabela usuarios
CREATE TABLE usuarios (
id serial,
    nome TEXT NOT NULL,
    idade SMALLINT,
    email VARCHAR(50),
    senha VARCHAR(8) NOT NULL    
);

--2. Inserir primeiros registros na tabela
INSERT INTO usuarios
(nome, idade, email, senha)
VALUES
('Aretha Montogomery', 30, 'augue.id.ante@odioAliquam.com', 'a0B13O3L'),
('Camden H. Bartlett', 15, 'turpis.vitae.purus@risusDuisa.ca', 'p3P96F3Q'),
('Raja W. Coffey', 30, 'raja.feugiat@nonummy.com', 's5F51T7L'),
('Elton D. Olsen', 29, 'auctor@duiFuscediam.edu', 'k5X25B0R'),
('Shelley E. Frederick', 20, 'raja.feugiat@nonummy.com', 'u2D18F6E');

--3. Alterar registro nome do usuario
UPDATE usuarios
SET nome = 'Raja W. Coffey Thomas'
WHERE id = 3;

--4. Para utilizar o constraint com email único seria necessário apagar o registro com o campo repetido. 
-- Porém optei por manter o registro e alterar apenas o campo email. 
UPDATE usuarios 
SET email = ''
WHERE id = 5;

ALTER TABLE usuarios ADD CONSTRAINT email_unique_usuarios UNIQUE(email);

-- 4.1 Excluir um dos registros com emails repetidos.
DELETE FROM usuarios
WHERE id = 5;

-- 5. Inserir registros na tabela
INSERT INTO usuarios
(nome, idade, email, senha)
VALUES
('Jermaine G. Sellers', 16, 'ligula.Nullam@tortordictum.co.uk', 'o2P56U9U'),
('James D. Kennedy', 23, 'amet@Nulladignissim.com', 'q6B78V3V'),
('Amelia S. Harris', 29, 'nec.metus.facilisis@vitaealiquet.edu', 'l4S64Y3A'),
('Joel M. Hartman', 18, 'montes.nascetur@odiotristique.co.uk', 'c4Q27D7O'),
('Elmo K. Greer', 18, 'risus.Duis@eget.ca', 'e3P92I7R');

-- Criada coluna situacao com valor boolean
ALTER TABLE usuarios ADD COLUMN situacao BOOLEAN DEFAULT true;

-- 6. você precisa atualizar o registro que possui o 
-- e-mail `montes.nascetur@odiotristique.co.uk` alterando a situação dele para falso.
UPDATE usuarios
SET situacao = false
WHERE email = 'montes.nascetur@odiotristique.co.uk';

-- 7. O registro que possui o e-mail `risus.Duis@eget.ca` 
-- solicitou alteração da sua senha para `k9P31H1O`
UPDATE usuarios
SET senha = 'k9P31H1O'
WHERE email = 'risus.Duis@eget.ca';

-- 7.1 Excluir o campo idade a adicionar campo data_nascimento
ALTER TABLE usuarios DROP COLUMN idade, ADD COLUMN data_nascimento DATE;


-- 8. Atualização de data de nascimento de registros.
UPDATE usuarios
SET data_nascimento = '1991-09-29'
WHERE email = 'auctor@duiFuscediam.edu';

UPDATE usuarios
SET data_nascimento = '1988-11-02'
WHERE email = 'nec.metus.facilisis@vitaealiquet.edu';

-- 9. excluir definitivamente todos os registros que estão sem a data de nascimento.
DELETE FROM usuarios
WHERE data_nascimento IS NULL;

-- 9.1 Torna o campo data_nascimento obrigatório..sql_features
ALTER TABLE usuarios ALTER COLUMN data_nascimento SET NOT NULL;

-- 10. Cadastrar novos registros.sql_features
INSERT INTO usuarios
(nome, email, senha, data_nascimento)
VALUES
('Tate I. Dean', 'Nunc@etmagnis.edu', 'd3V25D6Y', '1989-05-01'),
('Arsenio K. Harmon', 'adipiscing.elit@turpis.com', 'm3T58S0C', '1985-10-23');