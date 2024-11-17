use Est_Caso_2;

CREATE TABLE IF NOT EXISTS Voos(
    Voo_Codigo INT PRIMARY KEY,
    data_Hora_Origem DATETIME NOT NULL,
    data_Hora_Destino DATETIME NOT NULL,
    aeroporto_Origem VARCHAR(50) NOT NULL,
    aeroporto_Destino VARCHAR(50) NOT NULL,
    aeronave_Prefixo VARCHAR(10) NOT null,
    CONSTRAINT Aeronave_FK FOREIGN KEY(Aeronave_Prefixo)
    REFERENCES Aeronaves(aeronave_Prefixo)

INSERT INTO Voos (Voo_Codigo, data_Hora_Origem, data_Hora_Destino, aeroporto_Origem, aeroporto_Destino, aeronave_Prefixo)
VALUES (1001, '2024-11-16 08:00', '2024-11-16 10:00', 'Aeroporto de Guarulhos', 'Aeroporto de Congonhas', 'PT-ABC');

INSERT INTO Voos (Voo_Codigo, data_Hora_Origem, data_Hora_Destino, aeroporto_Origem, aeroporto_Destino, aeronave_Prefixo)
VALUES (1002, '2024-11-16 14:00', '2024-11-16 16:30', 'Aeroporto de Brasília', 'Aeroporto de Galeão', 'PT-DEF');

INSERT INTO Voos (Voo_Codigo, data_Hora_Origem, data_Hora_Destino, aeroporto_Origem, aeroporto_Destino, aeronave_Prefixo)
VALUES (1003, '2024-11-17 07:30', '2024-11-17 10:00', 'Aeroporto de Santos Dumont', 'Aeroporto de Recife', 'PT-GHI');

INSERT INTO Voos (Voo_Codigo, data_Hora_Origem, data_Hora_Destino, aeroporto_Origem, aeroporto_Destino, aeronave_Prefixo)
VALUES (1004, '2024-11-17 18:00', '2024-11-17 20:30', 'Aeroporto de Campinas', 'Aeroporto de Fortaleza', 'PT-JKL');

INSERT INTO Voos (Voo_Codigo, data_Hora_Origem, data_Hora_Destino, aeroporto_Origem, aeroporto_Destino, aeronave_Prefixo)
VALUES (1005, '2024-11-18 09:00', '2024-11-18 11:30', 'Aeroporto de São Paulo', 'Aeroporto de Salvador', 'PT-MNO');

UPDATE Voos
SET data_Hora_Origem = '2024-11-16 09:00'
WHERE Voo_Codigo = 1001;

UPDATE Voos
SET aeroporto_Destino = 'Aeroporto de Porto Alegre'
WHERE Voo_Codigo = 1002;

DELETE FROM Voos
WHERE Voo_Codigo = 1003;
);

CREATE TABLE IF NOT EXISTS Aeronaves(
    aeronave_Prefixo VARCHAR(10) PRIMARY KEY,
    aeronave_Modelo VARCHAR(45) NOT NULL,
    aeronave_anofabri INT NOT NULL,
    aeronave_capacidade INT NOT NULL,
    aeronave_Fabricante VARCHAR(45) NOT NULL

INSERT INTO Aeronaves (aeronave_Prefixo, aeronave_Modelo, aeronave_anofabri, aeronave_capacidade, aeronave_Fabricante)
VALUES ('PT-ABC', 'Boeing 737', 2018, 150, 'Boeing');

INSERT INTO Aeronaves (aeronave_Prefixo, aeronave_Modelo, aeronave_anofabri, aeronave_capacidade, aeronave_Fabricante)
VALUES ('PT-DEF', 'Airbus A320', 2020, 180, 'Airbus');

INSERT INTO Aeronaves (aeronave_Prefixo, aeronave_Modelo, aeronave_anofabri, aeronave_capacidade, aeronave_Fabricante)
VALUES ('PT-GHI', 'Embraer E195', 2017, 120, 'Embraer');

INSERT INTO Aeronaves (aeronave_Prefixo, aeronave_Modelo, aeronave_anofabri, aeronave_capacidade, aeronave_Fabricante)
VALUES ('PT-JKL', 'Bombardier CRJ900', 2015, 90, 'Bombardier');

INSERT INTO Aeronaves (aeronave_Prefixo, aeronave_Modelo, aeronave_anofabri, aeronave_capacidade, aeronave_Fabricante)
VALUES ('PT-MNO', 'Airbus A350', 2022, 280, 'Airbus');

UPDATE Aeronaves
SET aeronave_Modelo = 'Boeing 777'
WHERE aeronave_Prefixo = 'PT-ABC';

UPDATE Aeronaves
SET aeronave_capacidade = 160
WHERE aeronave_Prefixo = 'PT-DEF';

DELETE FROM Aeronaves
WHERE aeronave_Prefixo = 'PT-GHI';
);

ALTER TABLE Aeronaves
CHANGE COLUMN aeronave_anofabri aeronave_fabriano VARCHAR(50);

CREATE TABLE IF NOT EXISTS Aeroportos(
    aeroporto_Cod INT PRIMARY KEY,
    aeroporto_Nome VARCHAR(50) NOT NULL,
    aeroporto_Local VARCHAR(50) NOT NULL,
    aeroporto_País VARCHAR(50) NOT NULL,
    aeroporto_Longitude DECIMAL(9, 6) NOT NULL,
    aeroporto_Latitude DECIMAL(9, 6) NOT NULL

INSERT INTO Aeroportos (aeroporto_Cod, aeroporto_Nome, aeroporto_Local, aeroporto_País, aeroporto_Longitude, aeroporto_Latitude)
VALUES (1, 'Aeroporto de Guarulhos', 'São Paulo', 'Brasil', -46.4717, -23.4356);

INSERT INTO Aeroportos (aeroporto_Cod, aeroporto_Nome, aeroporto_Local, aeroporto_País, aeroporto_Longitude, aeroporto_Latitude)
VALUES (2, 'Aeroporto de Congonhas', 'São Paulo', 'Brasil', -46.6361, -23.6269);

INSERT INTO Aeroportos (aeroporto_Cod, aeroporto_Nome, aeroporto_Local, aeroporto_País, aeroporto_Longitude, aeroporto_Latitude)
VALUES (3, 'Aeroporto de Brasília', 'Brasília', 'Brasil', -47.9292, -15.7801);

INSERT INTO Aeroportos (aeroporto_Cod, aeroporto_Nome, aeroporto_Local, aeroporto_País, aeroporto_Longitude, aeroporto_Latitude)
VALUES (4, 'Aeroporto de Galeão', 'Rio de Janeiro', 'Brasil', -43.2433, -22.8097);

INSERT INTO Aeroportos (aeroporto_Cod, aeroporto_Nome, aeroporto_Local, aeroporto_País, aeroporto_Longitude, aeroporto_Latitude)
VALUES (5, 'Aeroporto de Santos Dumont', 'Rio de Janeiro', 'Brasil', -43.1633, -22.9103);

UPDATE Aeroportos
SET aeroporto_Nome = 'Aeroporto Internacional de São Paulo'
WHERE aeroporto_Cod = 1;

UPDATE Aeroportos
SET aeroporto_Latitude = -22.9155, aeroporto_Longitude = -43.1668
WHERE aeroporto_Cod = 5;

DELETE FROM Aeroportos
WHERE aeroporto_Cod = 2;
);

ALTER TABLE Aeroportos
MODIFY COLUMN aeroporto_Cod VARCHAR(5);

CREATE TABLE IF NOT EXISTS Reservas(
    FK_Voo INT NOT NULL,
    FK_Pass INT NOT NULL,
    CONSTRAINT voo_fk FOREIGN KEY (FK_Voo)
    REFERENCES Voos(Voo_Codigo),
    CONSTRAINT passageros_fk FOREIGN KEY(FK_Pass)
    REFERENCES Passageiros(pass_CPF)

INSERT INTO Reservas (FK_Voo, FK_Pass)
VALUES (1001, 5001);

INSERT INTO Reservas (FK_Voo, FK_Pass)
VALUES (1002, 5002);

INSERT INTO Reservas (FK_Voo, FK_Pass)
VALUES (1003, 5003);

INSERT INTO Reservas (FK_Voo, FK_Pass)
VALUES (1004, 5004);

INSERT INTO Reservas (FK_Voo, FK_Pass)
VALUES (1005, 5005);

UPDATE Reservas
SET FK_Pass = 5006
WHERE FK_Voo = 1001 AND FK_Pass = 5001;

UPDATE Reservas
SET FK_Voo = 1006
WHERE FK_Voo = 1002 AND FK_Pass = 5002;

DELETE FROM Reservas
WHERE FK_Voo = 1003 AND FK_Pass = 5003;
);

ALTER TABLE Reservas
ADD COLUMN Assento VARCHAR(2);

ALTER TABLE Reservas
DROP COLUMN Assento;

CREATE TABLE IF NOT EXISTS Passageiros(
    pass_CPF VARCHAR(11) PRIMARY KEY,
    pass_Nome VARCHAR(50) NOT NULL,
    pass_Tel VARCHAR(15),
    pass_End VARCHAR(100),
    pass_Email VARCHAR(100)

INSERT INTO Passageiros (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('123.456.789-00', 'João Silva', '(11) 91234-5678', 'Rua A, 123, São Paulo, SP', 'joao.silva@email.com');

INSERT INTO Passageiros (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('987.654.321-00', 'Maria Oliveira', '(21) 98765-4321', 'Rua B, 456, Rio de Janeiro, RJ', 'maria.oliveira@email.com');

INSERT INTO Passageiros (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('555.666.777-88', 'Carlos Pereira', '(31) 98877-6655', 'Avenida C, 789, Belo Horizonte, MG', 'carlos.pereira@email.com');

INSERT INTO Passageiros (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('333.444.555-66', 'Ana Souza', '(41) 93333-4444', 'Travessa D, 101, Curitiba, PR', 'ana.souza@email.com');

INSERT INTO Passageiros (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('222.333.444-55', 'Lucas Costa', '(51) 92222-3333', 'Rua E, 202, Porto Alegre, RS', 'lucas.costa@email.com');

UPDATE Passageiros
SET pass_Tel = '(11) 99888-7777'
WHERE pass_CPF = '123.456.789-00';

UPDATE Passageiros
SET pass_End = 'Avenida F, 333, São Paulo, SP'
WHERE pass_CPF = '987.654.321-00';

DELETE FROM Passageiros
WHERE pass_CPF = '555.666.777-88';
);

CREATE TABLE IF NOT EXISTS Passageiros_II(
    pass_CPF VARCHAR(11) PRIMARY KEY,
    pass_Nome VARCHAR(100) NOT NULL,
    pass_Tel VARCHAR(15),
    pass_End VARCHAR(100),
    pass_Email VARCHAR(100)

INSERT INTO Passageiros_II (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('123.456.789-00', 'João Silva', '(11) 91234-5678', 'Rua A, 123, São Paulo, SP', 'joao.silva@email.com');

INSERT INTO Passageiros_II (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('987.654.321-00', 'Maria Oliveira', '(21) 98765-4321', 'Rua B, 456, Rio de Janeiro, RJ', 'maria.oliveira@email.com');

INSERT INTO Passageiros_II (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('555.666.777-88', 'Carlos Pereira', '(31) 98877-6655', 'Avenida C, 789, Belo Horizonte, MG', 'carlos.pereira@email.com');

INSERT INTO Passageiros_II (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('333.444.555-66', 'Ana Souza', '(41) 93333-4444', 'Travessa D, 101, Curitiba, PR', 'ana.souza@email.com');

INSERT INTO Passageiros_II (pass_CPF, pass_Nome, pass_Tel, pass_End, pass_Email)
VALUES ('222.333.444-55', 'Lucas Costa', '(51) 92222-3333', 'Rua E, 202, Porto Alegre, RS', 'lucas.costa@email.com');

UPDATE Passageiros_II
SET pass_Tel = '(11) 9508-4577'
WHERE pass_CPF = '123.456.789-00';

UPDATE Passageiros_II
SET pass_End = 'Avenida F, 333, São Paulo, SP'
WHERE pass_CPF = '987.654.321-00';

DELETE FROM Passageiros_II
WHERE pass_CPF = '555.666.777-88';
);

DROP TABLE Passageiros_II;
CREATE TABLE IF NOT EXISTS Funcionarios(
    func_ID INT PRIMARY KEY,
    func_Funcao VARCHAR(50) NOT NULL,
    func_Nome VARCHAR(100) NOT NULL,
    func_Data_Nasc DATE NOT NULL,
    func_Tel VARCHAR(15) NOT NULL

INSERT INTO Funcionarios (func_ID, func_Funcao, func_Nome, func_Data_Nasc, func_Tel)
VALUES (1, 'Gerente', 'Carlos Souza', '1985-03-15', '(11) 91234-5678');

INSERT INTO Funcionarios (func_ID, func_Funcao, func_Nome, func_Data_Nasc, func_Tel)
VALUES (2, 'Assistente', 'Ana Oliveira', '1990-07-22', '(21) 98765-4321');

INSERT INTO Funcionarios (func_ID, func_Funcao, func_Nome, func_Data_Nasc, func_Tel)
VALUES (3, 'Analista', 'Lucas Pereira', '1980-11-05', '(31) 98877-6655');

INSERT INTO Funcionarios (func_ID, func_Funcao, func_Nome, func_Data_Nasc, func_Tel)
VALUES (4, 'Coordenador', 'Fernanda Costa', '1992-02-18', '(41) 93333-4444');

INSERT INTO Funcionarios (func_ID, func_Funcao, func_Nome, func_Data_Nasc, func_Tel)
VALUES (5, 'Diretor', 'João Silva', '1975-05-10', '(51) 92222-3333');

UPDATE Funcionarios
SET func_Funcao = 'Supervisor'
WHERE func_ID = 1;

UPDATE Funcionarios
SET func_Tel = '(21) 93219-8888'
WHERE func_ID = 2;

DELETE FROM Funcionarios
WHERE func_ID = 3;
);

CREATE TABLE IF NOT EXISTS Operam_Voo(
    Func_FK INT NOT null,
    Voos_FK INT NOT NULL,
    CONSTRAINT funcionarios_FK FOREIGN KEY(Func_FK)
    REFERENCES Funcionarios(func_ID),
    CONSTRAINT voos_FK FOREIGN KEY(Voos_FK)
    REFERENCES Voos(Voo_Codigo)

INSERT INTO Operam_Voo (Func_FK, Voos_FK)
VALUES (1, 1001);

INSERT INTO Operam_Voo (Func_FK, Voos_FK)
VALUES (2, 1002);

INSERT INTO Operam_Voo (Func_FK, Voos_FK)
VALUES (3, 1003);

INSERT INTO Operam_Voo (Func_FK, Voos_FK)
VALUES (4, 1004);

INSERT INTO Operam_Voo (Func_FK, Voos_FK)
VALUES (5, 1005);

UPDATE Operam_Voo
SET Voos_FK = 1006
WHERE Func_FK = 1 AND Voos_FK = 1001;

UPDATE Operam_Voo
SET Func_FK = 2
WHERE Func_FK = 5 AND Voos_FK = 1005;

DELETE FROM Operam_Voo
WHERE Func_FK = 3 AND Voos_FK = 1003;
);