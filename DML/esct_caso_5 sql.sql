Use Est_Caso_5;

CREATE TABLE IF NOT EXISTS Clientes(
    CPF_cliente VARCHAR(11) PRIMARY KEY,
    Nome_Clientes VARCHAR(100),
    Data_Nasc_Clientes DATE,
    Status_Fideli_Cliente ENUM('Ativo','Inativo','Pendente'),
    Cod_Pagamentos INT,
    CONSTRAINT FK_Pagamento_Clientes FOREIGN KEY(Cod_Pagamentos)
    REFERENCES Pagamentos(Cod_Pagamentos)


INSERT INTO Clientes (CPF_cliente, Nome_Clientes, Data_Nasc_Clientes, Status_Fideli_Cliente, Cod_Pagamentos)
VALUES ('12345678901', 'João Silva', '1985-03-25', 'Ativo', 101);

INSERT INTO Clientes (CPF_cliente, Nome_Clientes, Data_Nasc_Clientes, Status_Fideli_Cliente, Cod_Pagamentos)
VALUES ('23456789012', 'Maria Oliveira', '1990-07-15', 'Inativo', 102);

INSERT INTO Clientes (CPF_cliente, Nome_Clientes, Data_Nasc_Clientes, Status_Fideli_Cliente, Cod_Pagamentos)
VALUES ('34567890123', 'Carlos Pereira', '1982-11-05', 'Pendente', 103);

INSERT INTO Clientes (CPF_cliente, Nome_Clientes, Data_Nasc_Clientes, Status_Fideli_Cliente, Cod_Pagamentos)
VALUES ('45678901234', 'Ana Souza', '1995-06-20', 'Ativo', 104);

INSERT INTO Clientes (CPF_cliente, Nome_Clientes, Data_Nasc_Clientes, Status_Fideli_Cliente, Cod_Pagamentos)
VALUES ('56789012345', 'Paulo Santos', '2000-01-10', 'Ativo', 105);

UPDATE Clientes
SET Status_Fideli_Cliente = 'Inativo'
WHERE CPF_cliente = '12345678901';

UPDATE Clientes
SET Cod_Pagamentos = 106
WHERE CPF_cliente = '23456789012';

DELETE FROM Clientes
WHERE CPF_cliente = '34567890123';
);

CREATE TABLE IF NOT EXISTS Pagamentos(
    Cod_Pagamentos VARCHAR(50) PRIMARY KEY,
    Data_Pagamentos DATE NOT NULL,
    Valor_Pagamentos FLOAT NOT NULL,
    Status_Pagamento ENUM('PENDENTE','CONCLUÍDO','EM ESPERA'),
    Cod_Venda VARCHAR(50),
    CONSTRAINT FK_Vendas_Pag FOREIGN KEY (Cod_Venda)
    REFERENCES Vendas(Cod_Venda)

INSERT INTO Pagamentos (Cod_Pagamentos, Data_Pagamentos, Valor_Pagamentos, Status_Pagamento, Cod_Venda)
VALUES (1, '2024-01-15', 500.00, TRUE, 101);

INSERT INTO Pagamentos (Cod_Pagamentos, Data_Pagamentos, Valor_Pagamentos, Status_Pagamento, Cod_Venda)
VALUES (2, '2024-01-20', 1500.00, FALSE, 102);

INSERT INTO Pagamentos (Cod_Pagamentos, Data_Pagamentos, Valor_Pagamentos, Status_Pagamento, Cod_Venda)
VALUES (3, '2024-02-10', 700.50, TRUE, 103);

INSERT INTO Pagamentos (Cod_Pagamentos, Data_Pagamentos, Valor_Pagamentos, Status_Pagamento, Cod_Venda)
VALUES (4, '2024-02-15', 300.75, TRUE, 104);

INSERT INTO Pagamentos (Cod_Pagamentos, Data_Pagamentos, Valor_Pagamentos, Status_Pagamento, Cod_Venda)
VALUES (5, '2024-02-25', 1200.00, FALSE, 105);

UPDATE Pagamentos
SET Status_Pagamento = TRUE
WHERE Cod_Pagamentos = 2;

UPDATE Pagamentos
SET Valor_Pagamentos = 800.00
WHERE Cod_Venda = 104;

DELETE FROM Pagamentos
WHERE Cod_Pagamentos = 3;
);

CREATE TABLE IF NOT EXISTS Vendas(
    Cod_Venda VARCHAR(50) PRIMARY KEY,
    Nome_comprados VARCHAR(50) NOT NULL,
    QTD_Comprados INT not null,
    Cod_Pagamentos VARCHAR(50),
    CONSTRAINT FK_Pag_Vendas FOREIGN KEY (Cod_Pagamentos)
    REFERENCES Pagamentos(Cod_Pagamentos)

INSERT INTO Vendas (Cod_Venda, Nome_Comprados, QTD_Comprados, Cod_Pagamentos)
VALUES (101, 'Notebook', 1, 1);

INSERT INTO Vendas (Cod_Venda, Nome_Comprados, QTD_Comprados, Cod_Pagamentos)
VALUES (102, 'Smartphone', 2, 2);

INSERT INTO Vendas (Cod_Venda, Nome_Comprados, QTD_Comprados, Cod_Pagamentos)
VALUES (103, 'Monitor', 1, 3);

INSERT INTO Vendas (Cod_Venda, Nome_Comprados, QTD_Comprados, Cod_Pagamentos)
VALUES (104, 'Teclado Mecânico', 3, 4);

INSERT INTO Vendas (Cod_Venda, Nome_Comprados, QTD_Comprados, Cod_Pagamentos)
VALUES (105, 'Fone de Ouvido', 2, 5);

UPDATE Vendas
SET QTD_Comprados = 5
WHERE Cod_Venda = 104;

UPDATE Vendas
SET Nome_Comprados = 'Monitor Ultrawide'
WHERE Cod_Venda = 103;

DELETE FROM Vendas
WHERE Cod_Venda = 102;
);

CREATE TABLE IF NOT EXISTS Produtos(
    Cod_Prod VARCHAR(30) PRIMARY KEY,
    Estoque VARCHAR(100) NOT NULL,
    Preço FLOAT NOT NULL,
    Categoria VARCHAR(30)

INSERT INTO Produtos (Cod_Prod, Estoque, Preço, Categoria)
VALUES (1, 50, 2500.00, 'Eletrônicos');

INSERT INTO Produtos (Cod_Prod, Estoque, Preço, Categoria)
VALUES (2, 200, 1500.00, 'Telefonia');

INSERT INTO Produtos (Cod_Prod, Estoque, Preço, Categoria)
VALUES (3, 30, 800.00, 'Informática');

INSERT INTO Produtos (Cod_Prod, Estoque, Preço, Categoria)
VALUES (4, 100, 300.00, 'Periféricos');

INSERT INTO Produtos (Cod_Prod, Estoque, Preço, Categoria)
VALUES (5, 75, 200.00, 'Áudio');

UPDATE Produtos
SET Preço = 2200.00
WHERE Cod_Prod = 1;

UPDATE Produtos
SET Estoque = 120
WHERE Cod_Prod = 4;

DELETE FROM Produtos
WHERE Cod_Prod = 3;
);

ALTER TABLE Produtos
CHANGE COLUMN Categoria Categoria_Produtos VARCHAR(50);

ALTER TABLE Produtos
CHANGE COLUMN Categoria_Produtos Categoria VARCHAR(30);

CREATE TABLE IF NOT EXISTS Fornecedores(
    Cod_Fornecedores VARCHAR(30) PRIMARY KEY,
    Contato_Fornecedor VARCHAR(50) NOT NULL,
    Produtos_Fornecidos VARCHAR(50) NOT NULL,
    Cod_Prod VARCHAR(30),
    CONSTRAINT FK_Prod_Forn FOREIGN KEY (Cod_Prod)
    REFERENCES Produtos(Cod_Prod)

INSERT INTO Fornecedores (Cod_Fornecedores, Contato_Fornecedor, Produtos_Fornecidos, Cod_Prod)
VALUES (1, 'João Distribuidora', 'Notebook', 1);

INSERT INTO Fornecedores (Cod_Fornecedores, Contato_Fornecedor, Produtos_Fornecidos, Cod_Prod)
VALUES (2, 'Maria Eletrônicos', 'Smartphone', 2);

INSERT INTO Fornecedores (Cod_Fornecedores, Contato_Fornecedor, Produtos_Fornecidos, Cod_Prod)
VALUES (3, 'Carlos Tech', 'Monitor', 3);

INSERT INTO Fornecedores (Cod_Fornecedores, Contato_Fornecedor, Produtos_Fornecidos, Cod_Prod)
VALUES (4, 'Ana Components', 'Teclado Mecânico', 4);

INSERT INTO Fornecedores (Cod_Fornecedores, Contato_Fornecedor, Produtos_Fornecidos, Cod_Prod)
VALUES (5, 'Lucas Áudio', 'Fone de Ouvido', 5);

UPDATE Fornecedores
SET Contato_Fornecedor = 'João Distribuidora e Serviços'
WHERE Cod_Fornecedores = 1;

UPDATE Fornecedores
SET Produtos_Fornecidos = 'Monitor Ultrawide'
WHERE Cod_Fornecedores = 3;

DELETE FROM Fornecedores
WHERE Cod_Fornecedores = 5;
);

ALTER TABLE Fornecedores
ADD COLUMN Data_Fornecedores DATE;


ALTER TABLE Fornecedores
DROP COLUMN Data_Fornecedores;

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
    Clientes_CPF VARCHAR(11),
    CONSTRAINT FK_Clientes_End FOREIGN KEY(CPF)
    REFERENCES Clientes(CPF)

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Clientes_CPF)
VALUES (1, '123', 'Residencial', 'Rua das Flores', 'Apto 12', '12345-678', 'Centro', 'SP', 'São Paulo', '123.456.789-00');

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Clientes_CPF)
VALUES (2, '456', 'Comercial', 'Avenida Brasil', NULL, '98765-432', 'Jardins', 'RJ', 'Rio de Janeiro', '987.654.321-00');

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Clientes_CPF)
VALUES (3, '789', 'Residencial', 'Rua dos Ipês', 'Casa', '45678-123', 'Vila Nova', 'MG', 'Belo Horizonte', '456.789.123-00');

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Clientes_CPF)
VALUES (4, '101', 'Residencial', 'Praça da Sé', NULL, '54321-987', 'Centro Histórico', 'BA', 'Salvador', '654.321.987-00');

INSERT INTO Enderecos (ID_Enderecos, Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Clientes_CPF)
VALUES (5, '202', 'Comercial', 'Rua 25 de Março', 'Sala 301', '67890-123', 'Mercado', 'SP', 'São Paulo', '789.123.456-00');

UPDATE Enderecos
SET Logradouro_End = 'Rua Nova Esperança', Bairro_End = 'Vila Esperança'
WHERE ID_Enderecos = 3;

UPDATE Enderecos
SET Complemento = 'Bloco B, Apto 22'
WHERE ID_Enderecos = 1;

DELETE FROM Enderecos
WHERE ID_Enderecos = 4;
);


CREATE TABLE IF NOT EXISTS Clientes_Produtos(
    CPF VARCHAR(11),
    Cod_Prod VARCHAR(30),
    PRIMARY KEY(CPF, Cod_Prod),
    CONSTRAINT FK_Clientes_Produtos FOREIGN KEY(CPF)
    REFERENCES Clientes(CPF),
    CONSTRAINT FK_Produtos_Clientes FOREIGN KEY (Cod_Prod)
    REFERENCES Produtos(Cod_Prod)

INSERT INTO Clientes_Produtos (CPF, Cod_Prod)
VALUES ('123.456.789-00', 1);

INSERT INTO Clientes_Produtos (CPF, Cod_Prod)
VALUES ('987.654.321-00', 2);

INSERT INTO Clientes_Produtos (CPF, Cod_Prod)
VALUES ('456.789.123-00', 3);

INSERT INTO Clientes_Produtos (CPF, Cod_Prod)
VALUES ('654.321.987-00', 4);

INSERT INTO Clientes_Produtos (CPF, Cod_Prod)
VALUES ('789.123.456-00', 5);

UPDATE Clientes_Produtos
SET Cod_Prod = 4
WHERE CPF = '123.456.789-00' AND Cod_Prod = 1;

UPDATE Clientes_Produtos
SET CPF = '987.654.321-00'
WHERE CPF = '456.789.123-00' AND Cod_Prod = 3;

DELETE FROM Clientes_Produtos
WHERE CPF = '654.321.987-00' AND Cod_Prod = 4;
);

ALTER TABLE Clientes_Produtos
MODIFY COLUMN Cod_Prod VARCHAR(100);

ALTER TABLE Clientes_Produtos
MODIFY COLUMN Cod_Prod VARCHAR(30);

CREATE TABLE IF NOT EXISTS Vendas_Produtos(
    Cod_Venda VARCHAR(50),
    Cod_Prod VARCHAR(30),
    PRIMARY KEY(Cod_Venda, Cod_Prod),
    CONSTRAINT FK_Vendas_Produtos FOREIGN KEY(Cod_Venda)
    REFERENCES Vendas(Cod_Venda),
    CONSTRAINT FK_Produtos_Vendas FOREIGN KEY (Cod_Prod)
    REFERENCES Produtos(Cod_Prod)

INSERT INTO Vendas_Produtos (Cod_Venda, Cod_Prod)
VALUES (101, 1);

INSERT INTO Vendas_Produtos (Cod_Venda, Cod_Prod)
VALUES (102, 2);

INSERT INTO Vendas_Produtos (Cod_Venda, Cod_Prod)
VALUES (103, 3);

INSERT INTO Vendas_Produtos (Cod_Venda, Cod_Prod)
VALUES (104, 4);

INSERT INTO Vendas_Produtos (Cod_Venda, Cod_Prod)
VALUES (105, 5);

UPDATE Vendas_Produtos
SET Cod_Prod = 3
WHERE Cod_Venda = 101 AND Cod_Prod = 1;

UPDATE Vendas_Produtos
SET Cod_Venda = 106
WHERE Cod_Venda = 104 AND Cod_Prod = 4;

DELETE FROM Vendas_Produtos
WHERE Cod_Venda = 102 AND Cod_Prod = 2;
);

DROP TABLE Vendas_Produtos;