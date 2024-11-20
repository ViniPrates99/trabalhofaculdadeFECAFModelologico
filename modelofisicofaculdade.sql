create database db_faculdade;
Use db_faculdade;

CREATE TABLE Aluno (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

insert into aluno (
nome,
cpf,
data_nascimento,
email,
telefone
) values (

'José Amauri',
'25651301851',
'1989-03-29',
'jose1223@gmail.com',
'13836280'
);

CREATE TABLE Professor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) UNIQUE NOT NULL,
    especialidade VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20)
);

insert into professor (
nome,
cpf,
especialidade,
email,
telefone
) values (
'Clicia Oliveira',
'47145414825',
'Banco de dados',
'cli12@gmail.com',
'1478057966'
);

CREATE TABLE Curso (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    duracao INT, -- duração do curso em meses
    descricao TEXT
);

insert into curso (
nome,
duracao,
descricao
)  values (
'ADS',
'3',
'aprende a desenvolver sistemas de maneira correta e estruturada'
);

CREATE TABLE Materia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    carga_horaria INT, -- carga horária da matéria em horas
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id) ON DELETE CASCADE
);

insert into materia (
nome,
descricao,
carga_horaria,
id_curso) values (
'banco de dados',
'aprenda a desenvover banco de dados de maneira organizada e estruturada com bases nas normas, utilizando programas como MySQL, Maria DB e outros',
'3',
1);

CREATE TABLE Turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL,
    id_materia INT NOT NULL,
    id_professor INT NOT NULL,
    semestre INT,
    ano INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id) ON DELETE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES Materia(id) ON DELETE CASCADE,
    FOREIGN KEY (id_professor) REFERENCES Professor(id) ON DELETE CASCADE
);

insert into turma (
id_curso,
id_materia,
id_professor,
semestre,
ano
) values (
1,
1,
1,
2,
2024);


CREATE TABLE Aluno_Turma (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id) ON DELETE CASCADE,
    FOREIGN KEY (id_turma) REFERENCES Turma(id) ON DELETE CASCADE
);

 insert into aluno_turma (
 id_aluno,
 id_turma
 ) values (
 2,
 1
 );
 select*from aluno;

CREATE TABLE Nota (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT NOT NULL,
    id_turma INT NOT NULL,
    id_materia INT NOT NULL, -- Adicionado o ID da matéria
    nota DECIMAL(4, 2),
    data_avaliacao DATE,
    FOREIGN KEY (id_aluno) REFERENCES Aluno(id) ON DELETE CASCADE,
    FOREIGN KEY (id_turma) REFERENCES Turma(id) ON DELETE CASCADE,
    FOREIGN KEY (id_materia) REFERENCES Materia(id) ON DELETE CASCADE
);

insert into nota (
id_aluno,
id_turma,
id_materia,
nota,
data_avaliacao
) values (
'2',
'1',
'1',
'5.9',
'2024-11-18');

drop table nota;

use db_faculdade;
show tables;
 