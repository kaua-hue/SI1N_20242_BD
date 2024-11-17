Use Est_Caso_4;

CREATE TABLE IF NOT EXISTS Alunos(
    Matricula INT PRIMARY KEY,
    Data_Nasc_Aluno DATE NOT NULL,
    Modalidades_Interesse VARCHAR(30) NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    Cod_Pagamento VARCHAR(35) NOT NULL,
    PT_Personalizado BOOLEAN NOT NULL,
    CONSTRAINT FK_Pag_Alunos FOREIGN KEY (Cod_Pagamento)
    REFERENCES Pagamentos(Cod_Pagamento),
    CONSTRAINT FK_PT_Alunos FOREIGN KEY(PT_Personalizado)
    REFERENCES Plano_Treinamento(PT_Personalizado)

INSERT INTO Alunos (Matricula, Data_Nasc_Aluno, Modalidades_Interesse, CPF, Cod_Pagamento, PT_Personalizado)
VALUES (1001, '1990-05-15', 'Musculação, Pilates', '123.456.789-00', 1, TRUE);

INSERT INTO Alunos (Matricula, Data_Nasc_Aluno, Modalidades_Interesse, CPF, Cod_Pagamento, PT_Personalizado)
VALUES (1002, '1985-11-30', 'Yoga, Crossfit', '987.654.321-00', 2, FALSE);

INSERT INTO Alunos (Matricula, Data_Nasc_Aluno, Modalidades_Interesse, CPF, Cod_Pagamento, PT_Personalizado)
VALUES (1003, '2000-08-22', 'Natação, Musculação', '456.789.123-00', 3, TRUE);

INSERT INTO Alunos (Matricula, Data_Nasc_Aluno, Modalidades_Interesse, CPF, Cod_Pagamento, PT_Personalizado)
VALUES (1004, '1995-03-10', 'Pilates, Funcional', '654.321.987-00', 4, FALSE);

INSERT INTO Alunos (Matricula, Data_Nasc_Aluno, Modalidades_Interesse, CPF, Cod_Pagamento, PT_Personalizado)
VALUES (1005, '1998-12-05', 'Crossfit, Yoga', '789.123.456-00', 5, TRUE);

UPDATE Alunos
SET Modalidades_Interesse = 'Musculação, Corrida'
WHERE Matricula = 1001;

UPDATE Alunos
SET PT_Personalizado = TRUE
WHERE Matricula = 1002;

DELETE FROM Alunos
WHERE Matricula = 1003;
);

CREATE TABLE IF NOT EXISTS Pagamentos(
    Cod_Pagamento VARCHAR(50) PRIMARY KEY,
    Valor_Pagamento FLOAT NOT NULL,
    Data_Pagamento DATE NOT NULL,
    Status_Pagamento ENUM('Pendente','Pago','Cancelado') NOT NULL

INSERT INTO Pagamentos (Cod_Pagamento, Valor_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES (1, 1500.00, '2024-01-15', 'Pago');

INSERT INTO Pagamentos (Cod_Pagamento, Valor_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES (2, 500.00, '2024-02-20', 'Pendente');

INSERT INTO Pagamentos (Cod_Pagamento, Valor_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES (3, 1200.75, '2024-03-10', 'Pago');

INSERT INTO Pagamentos (Cod_Pagamento, Valor_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES (4, 800.00, '2024-04-05', 'Cancelado');

INSERT INTO Pagamentos (Cod_Pagamento, Valor_Pagamento, Data_Pagamento, Status_Pagamento)
VALUES (5, 2200.00, '2024-05-22', 'Pendente');

UPDATE Pagamentos
SET Status_Pagamento = 'Pago'
WHERE Cod_Pagamento = 2;

UPDATE Pagamentos
SET Valor_Pagamento = 1400.50
WHERE Cod_Pagamento = 4;

DELETE FROM Pagamentos
WHERE Cod_Pagamento = 3;
);

ALTER TABLE Pagamentos
ADD COLUMN Descri_Pagamento TEXT;


ALTER TABLE Pagamentos
DROP COLUMN Descri_Pagamento;

CREATE TABLE IF NOT EXISTS Plano_Treinamento(
    PT_Personalizado BOOLEAN NOT NULL,
    Progresso_Aluno ENUM('Iniciante','Intermediario','Avançado') NOT NULL

INSERT INTO Plano_Treinamento (PT_Personalizado, Progresso_Aluno)
VALUES (TRUE, 'Iniciante');

INSERT INTO Plano_Treinamento (PT_Personalizado, Progresso_Aluno)
VALUES (FALSE, 'Intermediario');

INSERT INTO Plano_Treinamento (PT_Personalizado, Progresso_Aluno)
VALUES (TRUE, 'Avançado');

INSERT INTO Plano_Treinamento (PT_Personalizado, Progresso_Aluno)
VALUES (FALSE, 'Iniciante');

INSERT INTO Plano_Treinamento (PT_Personalizado, Progresso_Aluno)
VALUES (TRUE, 'Intermediario');

UPDATE Plano_Treinamento
SET Plano_Treinamento = 'Intermediario'

UPDATE Plano_Treinamento
SET PT_Personalizado = FALSE

DELETE FROM Plano_Treinamento
WHERE Plano_Treinamento;
);

CREATE TABLE IF NOT EXISTS Instrutores(
    Cod_Instrutor VARCHAR(20) INT PRIMARY KEY,
    Alunos_Instrutor INT NOT NULL,
    PT_Personalizado BOOLEAN NOT NULL,
    Dia_Horario_Aula DATETIME,
    CONSTRAINT FK_PT_Inst FOREIGN KEY (PT_Personalizado)
    REFERENCES Plano_Treinamento(PT_Personalizado),
    CONSTRAINT FK_Aulas_Inst FOREIGN KEY (Dia_Horario_Aula)
    REFERENCES Aulas(Dia_Horario_Aula)

INSERT INTO Instrutores (Cod_Instrutor, Alunos_Instrutor, PT_Personalizado, Dia_Horario_Aula)
VALUES (1, 1001, TRUE, 'Segunda-feira, 08:00');

INSERT INTO Instrutores (Cod_Instrutor, Alunos_Instrutor, PT_Personalizado, Dia_Horario_Aula)
VALUES (2, 1002, FALSE, 'Terça-feira, 10:00');

INSERT INTO Instrutores (Cod_Instrutor, Alunos_Instrutor, PT_Personalizado, Dia_Horario_Aula)
VALUES (3, 1003, TRUE, 'Quarta-feira, 14:00');

INSERT INTO Instrutores (Cod_Instrutor, Alunos_Instrutor, PT_Personalizado, Dia_Horario_Aula)
VALUES (4, 1004, FALSE, 'Quinta-feira, 16:00');

INSERT INTO Instrutores (Cod_Instrutor, Alunos_Instrutor, PT_Personalizado, Dia_Horario_Aula)
VALUES (5, 1005, TRUE, 'Sexta-feira, 09:00');

UPDATE Instrutores
SET Dia_Horario_Aula = 'Segunda-feira, 10:00'
WHERE Cod_Instrutor = 1;

UPDATE Instrutores
SET PT_Personalizado = FALSE
WHERE Cod_Instrutor = 2;

DELETE FROM Instrutores
WHERE Cod_Instrutor = 3;
);

CREATE TABLE IF NOT EXISTS Aulas(
    Cod_aula INT PRIMARY KEY,
    Dia_Horario_Aula DATETIME,
    Capacidade INT NOT NULL

INSERT INTO Aulas (Cod_Aula, Dia_Horario_Aula, Capacidade)
VALUES (1, 'Segunda-feira, 08:00', 20);

INSERT INTO Aulas (Cod_Aula, Dia_Horario_Aula, Capacidade)
VALUES (2, 'Terça-feira, 10:00', 25);

INSERT INTO Aulas (Cod_Aula, Dia_Horario_Aula, Capacidade)
VALUES (3, 'Quarta-feira, 14:00', 15);

INSERT INTO Aulas (Cod_Aula, Dia_Horario_Aula, Capacidade)
VALUES (4, 'Quinta-feira, 16:00', 30);

INSERT INTO Aulas (Cod_Aula, Dia_Horario_Aula, Capacidade)
VALUES (5, 'Sexta-feira, 09:00', 20);

UPDATE Aulas
SET Dia_Horario_Aula = 'Segunda-feira, 09:00'
WHERE Cod_Aula = 1;

UPDATE Aulas
SET Capacidade = 18
WHERE Cod_Aula = 3;

DELETE FROM Aulas
WHERE Cod_Aula = 4;
);

ALTER TABLE Aulas
MODIFY COLUMN Capacidade VARCHAR(100);

ALTER TABLE Aulas
MODIFY COLUMN Capacidade INT NOT NULL;

CREATE TABLE IF NOT EXISTS Modalidades(
    Modalidade_Codigo VARCHAR(30) PRIMARY KEY,
    Modalidade_Nome VARCHAR(100) NOT NULL,
    Alunos_Matriculados INT NOT NULL

INSERT INTO Modalidades (Modalidade_Codigo, Modalidade_Nome, Alunos_Matriculados)
VALUES (1, 'Musculação', 1001);

INSERT INTO Modalidades (Modalidade_Codigo, Modalidade_Nome, Alunos_Matriculados)
VALUES (2, 'Pilates', 1002);

INSERT INTO Modalidades (Modalidade_Codigo, Modalidade_Nome, Alunos_Matriculados)
VALUES (3, 'Crossfit', 1003);

INSERT INTO Modalidades (Modalidade_Codigo, Modalidade_Nome, Alunos_Matriculados)
VALUES (4, 'Yoga', 1004);

INSERT INTO Modalidades (Modalidade_Codigo, Modalidade_Nome, Alunos_Matriculados)
VALUES (5, 'Natação', 1005);

UPDATE Modalidades
SET Modalidade_Nome = 'Pilates Avançado'
WHERE Modalidade_Codigo = 2;

UPDATE Modalidades
SET Alunos_Matriculados = 1006
WHERE Modalidade_Codigo = 3;

DELETE FROM Modalidades
WHERE Modalidade_Codigo = 4;
);

ALTER TABLE Modalidades
CHANGE COLUMN Modalidade_Codigo Codigo_Modalidade VARCHAR(50);

ALTER TABLE Modalidades
CHANGE COLUMN Codigo_Modalidade Modalidade_Codigo VARCHAR(50);

CREATE TABLE IF NOT EXISTS Enderecos(
    ID_Enderecos INT PRIMARY KEY,
    Num_End INT NOT NULL,
    Tipo_End VARCHAR(20) NOT NULL,
    Logradouro_End VARCHAR(50) NOT NULL,
    Complemento VARCHAR(100),
    CEP_End INT NOT NULL,
    Bairro_End VARCHAR(50) NOT NULL,
    Estado_End VARCHAR(30) NOT NULL,
    Cidade_End VARCHAR(50) NOT NULL,
    Matricula INT NOT null,
    CONSTRAINT FK_Alunos_End FOREIGN KEY(Matricula)
    REFERENCES Alunos(Matricula)

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula)
VALUES (1, 123, 'Residencial', 'Rua A', 'Apt. 101', '12345-678', 'Centro', 'SP', 'São Paulo', 1001);

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula)
VALUES (2, 456, 'Comercial', 'Avenida B', 'Sala 202', '23456-789', 'Jardins', 'RJ', 'Rio de Janeiro', 1002);

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula)
VALUES (3, 789, 'Residencial', 'Rua C', 'Casa 5', '34567-890', 'Vila Nova', 'MG', 'Belo Horizonte', 1003);

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula)
VALUES (4, 101, 'Residencial', 'Rua D', 'Casa 10', '45678-901', 'Bairro São José', 'PR', 'Curitiba', 1004);

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula)
VALUES (5, 202, 'Comercial', 'Avenida E', 'Loja 15', '56789-012', 'Centro', 'BA', 'Salvador', 1005);

UPDATE Enderecos
SET Complemento = 'Apartamento 301'
WHERE ID_Endereços = 1;

UPDATE Enderecos
SET Estado_End = 'RS', Cidade_End = 'Porto Alegre'
WHERE ID_Enderecos = 2;

DELETE FROM Enderecos
WHERE ID_Enderecos = 3;
);

CREATE TABLE IF NOT EXISTS Alunos_Modalidade(
    Matricula INT NOT NULL,
    Modalidade_Codigo INT NOT NULL,
    PRIMARY KEY(Matricula, Modalidade_Codigo),
    CONSTRAINT FK_Alunos_Modalidades FOREIGN KEY(Matricula)
    REFERENCES Alunos(Matricula),
    CONSTRAINT FK_Modalidades_Alunos FOREIGN KEY(Modalidade_Codigo)
    REFERENCES Modalidades(Modalidade_Codigo)

INSERT INTO Alunos_Modalidades (Matricula, Modalidade_Codigo)
VALUES (1001, 1);

INSERT INTO Alunos_Modalidades (Matricula, Modalidade_Codigo)
VALUES (1002, 2);

INSERT INTO Alunos_Modalidades (Matricula, Modalidade_Codigo)
VALUES (1003, 3);

INSERT INTO Alunos_Modalidades (Matricula, Modalidade_Codigo)
VALUES (1004, 4);

INSERT INTO Alunos_Modalidades (Matricula, Modalidade_Codigo)
VALUES (1005, 5);

UPDATE Alunos_Modalidades
SET Modalidade_Codigo = 3
WHERE Matricula = 1001;

UPDATE Alunos_Modalidades
SET Matricula = 1006
WHERE Modalidade_Codigo = 2;

DELETE FROM Alunos_Modalidades
WHERE Matricula = 1003 AND Modalidade_Codigo = 3;
);

DROP TABLE Modalidades;

CREATE TABLE IF NOT EXISTS Aluno_Aula(
    Matricula INT NOT NULL,
    Dia_Horario_Aula DATETIME,
    PRIMARY KEY(Matricula, Dia_Horario_Aula),
    CONSTRAINT FK_Aluno_Aula FOREIGN KEY(Matricula)
    REFERENCES Alunos(Matricula),
    CONSTRAINT FK_Aula_Aluno FOREIGN KEY(Dia_Horario_Aula)
    REFERENCES AulaS(Dia_Horario_Aula)

INSERT INTO Aluno_Aula (Matricula, Dia_Horario_Aula)
VALUES (1001, 'Segunda-feira, 08:00');

INSERT INTO Aluno_Aula (Matricula, Dia_Horario_Aula)
VALUES (1002, 'Terça-feira, 10:00');

INSERT INTO Aluno_Aula (Matricula, Dia_Horario_Aula)
VALUES (1003, 'Quarta-feira, 14:00');

INSERT INTO Aluno_Aula (Matricula, Dia_Horario_Aula)
VALUES (1004, 'Quinta-feira, 16:00');

INSERT INTO Aluno_Aula (Matricula, Dia_Horario_Aula)
VALUES (1005, 'Sexta-feira, 09:00');

UPDATE Aluno_Aula
SET Dia_Horario_Aula = 'Segunda-feira, 09:00'
WHERE Matricula = 1001;

UPDATE Aluno_Aula
SET Matricula = 1006
WHERE Dia_Horario_Aula = 'Quarta-feira, 14:00';

DELETE FROM Aluno_Aula
WHERE Matricula = 1003 AND Dia_Horario_Aula = 'Quarta-feira, 14:00';
);