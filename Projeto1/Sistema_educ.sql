--***DDL***
--Criação de tabelas

CREATE TABLE alunos(
	cpf int PRIMARY KEY,
	nome varchar(50) not null,
	idade int,
	rua text,
	numero varchar(10),
	bairro varchar(20),
	cidade varchar(20),
	estado varchar(20),
	cep int,
	pais varchar(20)
)

ALTER TABLE alunos ALTER COLUMN cpf TYPE varchar(15)

SELECT * FROM alunos

CREATE TABLE departamentos(
	id_dep serial PRIMARY KEY,
	nome_dep varchar(20)
)

CREATE TABLE cursos(
	id_curso serial PRIMARY KEY,
	nome_curso varchar(40),
	id_dep serial REFERENCES departamentos
)

CREATE TABLE matriculas(
	ra serial PRIMARY KEY,
	cpf varchar(15) REFERENCES alunos,
	status varchar(10),
	id_curso int REFERENCES cursos
)

CREATE TABLE disciplinas(
	id_disc serial PRIMARY KEY,
	nome_disc varchar(40),
	optativa boolean
)

CREATE TABLE curso_disciplinas(
	id_curso serial REFERENCES cursos,
	id_disc serial REFERENCES disciplinas
)

CREATE TABLE matriculas_disciplinas(
	ra serial REFERENCES matriculas,
	id_disc serial REFERENCES disciplinas
)

--***DML***
--Povoar alunos
INSERT INTO alunos (cpf, nome, idade, rua, numero, bairro, cidade, estado, cep, pais)
VALUES
    ('123.456.789-00', 'Gisele Bundchen', 25, 'Av. Brigadeiro Faria Lima', '1500', 'Jardim Paulistano', 'São Paulo', 'SP', 1451000, 'Brasil'),
    ('987.654.321-00', 'Ayrton Senna', 30, 'Av. Paulista', '2355', 'Bela Vista', 'São Paulo', 'SP', 1311300, 'Brasil'),
    ('111.222.333-44', 'Pelé', 22, 'Av. Brasil', '1200', 'Jardim América', 'Rio de Janeiro', 'RJ', 20040003, 'Brasil'),
    ('999.888.777-66', 'Cristiano Ronaldo', 35, 'Av. Atlântica', '1702', 'Copacabana', 'Rio de Janeiro', 'RJ', 22021001, 'Brasil'),
    ('222.333.444-55', 'Lionel Messi', 28, 'Calle Suipacha', '1140', 'Retiro', 'Buenos Aires', NULL, 1011, 'Argentina'),
    ('444.555.666-77', 'Tom Brady', 40, '1 Patriot Pl', NULL, 'Foxborough', 'Massachusetts', 'MA', 2035, 'Estados Unidos'),
    ('555.666.777-88', 'Serena Williams', 33, 'Palm Beach Island', NULL, 'Palm Beach', 'Flórida', 'FL', 33480, 'Estados Unidos'),
    ('666.777.888-99', 'Usain Bolt', 31, 'Sunset Boulevard', NULL, 'West Hollywood', 'California', 'CA', 90069, 'Estados Unidos'),
    ('777.888.999-00', 'Michael Jordan', 45, 'E Oak St', '875', 'Chicago', 'Illinois', 'IL', 60611, 'Estados Unidos');

--Povoar departamentos
INSERT INTO departamentos (nome_dep) VALUES
    ('Tecnologia'),
    ('Engenharia'),
    ('Medicina'),
    ('Humanas'),
    ('Economia');
	
-- Povoar cursos
INSERT INTO cursos (nome_curso, id_dep) VALUES
    ('Ciência da Computação', 1),  -- Tecnologia
    ('Engenharia Elétrica', 2),  -- Engenharia
    ('Medicina Geral', 3),  -- Medicina
    ('Filosofia', 4),  -- Humanas
    ('Economia', 5),  -- Economia
    ('Engenharia de Software', 1),  -- Tecnologia
    ('Engenharia Mecânica', 2),  -- Engenharia
    ('Pediatria', 3),  -- Medicina
    ('História', 4),  -- Humanas
    ('Contabilidade', 5);  -- Economia

-- Povoar tabelas
INSERT INTO matriculas (cpf, status, id_curso) VALUES
    ('123.456.789-00', 'cursando', 1),  -- Curso: Ciência da Computação
    ('987.654.321-00', 'formado', 2),  -- Curso: Engenharia Elétrica
    ('111.222.333-44', 'desistente', 3),  -- Curso: Medicina Geral
    ('999.888.777-66', 'cursando', 4),  -- Curso: Filosofia
    ('222.333.444-55', 'formado', 5),  -- Curso: Economia
    ('444.555.666-77', 'cursando', 6),  -- Curso: Engenharia de Software
    ('555.666.777-88', 'formado', 7),  -- Curso: Engenharia Mecânica
    ('666.777.888-99', 'cursando', 8),  -- Curso: Pediatria
    ('777.888.999-00', 'desistente', 9);  -- Curso: História

INSERT INTO disciplinas (nome_disc, optativa) VALUES
    ('Algoritmos', false),  -- Ciência da Computação (Tecnologia)
    ('Circuitos Elétricos', false),  -- Engenharia Elétrica (Engenharia)
    ('Anatomia', true),  -- Medicina Geral (Medicina)
    ('Ética', true),  -- Filosofia (Humanas)
    ('Macroeconomia', false),  -- Economia (Economia)
    ('Programação Orientada a Objetos', false),  -- Engenharia de Software (Tecnologia)
    ('Mecânica dos Fluidos', true),  -- Engenharia Mecânica (Engenharia)
    ('Pediatria Clínica', true),  -- Pediatria (Medicina)
    ('História Antiga', false),  -- História (Humanas)
    ('Contabilidade Gerencial', false);  -- Contabilidade (Economia)	


-- Mostrar todos os dados dos alunos
SELECT * FROM alunos WHERE nome = 'Ayrton Senna'

SELECT * FROM matriculas INNER JOIN alunos USING (cpf)
WHERE nome = 'Ayrton Senna' OR ra = '2'

--Exibir curso associados a um departamento
SELECT * FROM departamentos

SELECT departamentos.nome_dep, cursos.nome_curso FROM departamentos 
NATURAL INNER JOIN cursos WHERE nome_dep = 'Engenharia'

-- Dado o nome de uma disciplina, exibir o nome dos cursos
SELECT * FROM disciplinas NATURAL INNER JOIN curso_disciplinas
NATURAL INNER JOIN cursos

-- Mostrar pelo cpf as disciplinas de um aluno (Gisele fez dois cursos cada curso tem 4 disciplinas relacionadas)
SELECT a.cpf, a.nome, d.nome_disc
FROM alunos a
INNER JOIN matriculas m ON a.cpf = m.cpf
INNER JOIN matriculas_disciplinas md ON m.ra = md.ra
INNER JOIN disciplinas d ON md.id_disc = d.id_disc
WHERE a.cpf = '123.456.789-00'; -- Gisele

--Filtrar alunos em um curso específico
SELECT a.cpf, a.nome
FROM alunos a
INNER JOIN matriculas m ON a.cpf = m.cpf
INNER JOIN cursos c ON m.id_curso = c.id_curso
WHERE c.nome_curso = 'Ciência da Computação'; -- Curso desejado

-- Filtrar todos alunos em uma disciplina específica
SELECT a.cpf, a.nome , d.nome_disc
FROM alunos a
INNER JOIN matriculas m ON a.cpf = m.cpf
INNER JOIN matriculas_disciplinas md ON m.ra = md.ra
INNER JOIN disciplinas d ON md.id_disc = d.id_disc
WHERE d.nome_disc = 'Algoritmos'; -- Disciplina desejada

--Alunos formados (Por isso Ayrton Senna sabia tudo sobre seu carro!)
SELECT a.nome, m.status AS nome_aluno, c.nome_curso
FROM alunos a
INNER JOIN matriculas m ON a.cpf = m.cpf
INNER JOIN cursos c ON m.id_curso = c.id_curso
WHERE m.status = 'formado';

-- Alunos ativos
SELECT a.nome, m.status AS nome_aluno, c.nome_curso
FROM alunos a
INNER JOIN matriculas m ON a.cpf = m.cpf
INNER JOIN cursos c ON m.id_curso = c.id_curso
WHERE m.status = 'cursando';

-- Apresentar a quantidade de alunos por curso
SELECT nome_curso, COUNT(nome) FROM ((alunos NATURAL INNER JOIN matriculas)
NATURAL INNER JOIN cursos)
WHERE status = 'cursando'
GROUP BY nome_curso

-- Apresentar nº de alunos em uma disciplina
SELECT nome_disc, COUNT(nome) FROM ((alunos NATURAL INNER JOIN matriculas)
NATURAL INNER JOIN matriculas_disciplinas)
NATURAL INNER JOIN disciplinas
WHERE status = 'cursando'
GROUP BY nome_disc







