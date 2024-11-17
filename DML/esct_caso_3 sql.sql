Use Est_Caso_3;
CREATE TABLE IF NOT EXISTS Clientes (
    cod_Cliente INT PRIMARY KEY,
    CNPJ_Clientes VARCHAR(20) NOT NULL UNIQUE,
    Razao_Social VARCHAR(300) NOT NULL,
    Data_de_Cadastramento DATE NOT NULL,
    P_Contato_Clientes VARCHAR(100) NOT NULL,
    Num_Encomenda INT NOT NULL,
    Id_Enderecos INT,
    CONSTRAINT FK_Enc_Cli FOREIGN KEY(Num_Encomenda)
    REFERENCES Encomendas(Num_Encomendas),
    CONSTRAINT FK_End_Cli FOREIGN KEY(Id_Enderecos)
    REFERENCES Enderecos(ID_Enderecos)

INSERT INTO Clientes (CNPJ_Clientes, Razao_Social, Data_de_Cadastramento, P_Contato_Clientes, Num_Encomenda, Id_Enderecos)
VALUES ('12345678000195', 'Empresa ABC Ltda', '2024-01-15', 'João Silva', 5, 1);

INSERT INTO Clientes (CNPJ_Clientes, Razao_Social, Data_de_Cadastramento, P_Contato_Clientes, Num_Encomenda, Id_Enderecos)
VALUES ('98765432000120', 'XYZ Comércio S.A.', '2024-02-20', 'Maria Oliveira', 3, 2);

INSERT INTO Clientes (CNPJ_Clientes, Razao_Social, Data_de_Cadastramento, P_Contato_Clientes, Num_Encomenda, Id_Enderecos)
VALUES ('11223344000150', 'Tecno Solutions', '2024-03-10', 'Carlos Almeida', 7, 3);

INSERT INTO Clientes (CNPJ_Clientes, Razao_Social, Data_de_Cadastramento, P_Contato_Clientes, Num_Encomenda, Id_Enderecos)
VALUES ('22334455000170', 'Logística Eficiente', '2024-04-05', 'Fernanda Souza', 2, 4);

INSERT INTO Clientes (CNPJ_Clientes, Razao_Social, Data_de_Cadastramento, P_Contato_Clientes, Num_Encomenda, Id_Enderecos)
VALUES ('55667788000190', 'Distribuidora Global', '2024-05-12', 'Ricardo Pereira', 10, 5);

UPDATE Clientes
SET Num_Encomenda = 8
WHERE cod_Cliente = 3;

UPDATE Clientes
SET P_Contato_Clientes = 'Roberta Ferreira'
WHERE cod_Cliente = 2;

DELETE FROM Clientes
WHERE cod_Cliente = 4;
);

CREATE TABLE IF NOT EXISTS Encomendas(
    Num_Encomendas INT PRIMARY KEY,
    Data_Inclusao_Enc DATE NOT NULL,
    Valor_Total_Enc DECIMAL(10, 2) NOT NULL,
    Valor_Desc_Enc DECIMAL(10, 2) NOT NULL,
    Valor_Liq_Enc DECIMAL(10, 2) NOT NULL,
    ID_Forma_Pag INT,
    Quant_Pac INT NOT NULL

INSERT INTO Encomendas (Data_Inclusao_Enc, Valor_Total_Enc, Valor_Desc_Enc, Valor_Liq_Enc, ID_Forma_Pag, Quant_Pac)
VALUES ('2024-11-01', 500.00, 50.00, 450.00, 1, 5);

INSERT INTO Encomendas (Data_Inclusao_Enc, Valor_Total_Enc, Valor_Desc_Enc, Valor_Liq_Enc, ID_Forma_Pag, Quant_Pac)
VALUES ('2024-11-02', 1000.00, 100.00, 900.00, 2, 10);

INSERT INTO Encomendas (Data_Inclusao_Enc, Valor_Total_Enc, Valor_Desc_Enc, Valor_Liq_Enc, ID_Forma_Pag, Quant_Pac)
VALUES ('2024-11-03', 750.00, 75.00, 675.00, 3, 8);

INSERT INTO Encomendas (Data_Inclusao_Enc, Valor_Total_Enc, Valor_Desc_Enc, Valor_Liq_Enc, ID_Forma_Pag, Quant_Pac)
VALUES ('2024-11-04', 300.00, 30.00, 270.00, 4, 3);

INSERT INTO Encomendas (Data_Inclusao_Enc, Valor_Total_Enc, Valor_Desc_Enc, Valor_Liq_Enc, ID_Forma_Pag, Quant_Pac)
VALUES ('2024-11-05', 1200.00, 200.00, 1000.00, 5, 15);


UPDATE Encomendas
SET Valor_Desc_Enc = 80.00, Valor_Liq_Enc = 920.00
WHERE Num_Encomendas = 2;

UPDATE Encomendas
SET Quant_Pac = 20
WHERE Num_Encomendas = 5;

DELETE FROM Encomendas
WHERE Num_Encomendas = 4;
);

ALTER TABLE Encomendas
ADD COLUMN data_Random DATE;

ALTER TABLE Encomendas
DROP COLUMN data_Random;

CREATE TABLE IF NOT EXISTS Enderecos(
    ID_Enderecos INT PRIMARY KEY,
    Num_End INT NOT NULL,
    Tipo_End VARCHAR(50) NOT NULL,
    Logradouro_End VARCHAR(200) NOT NULL,
    Complemento VARCHAR(100),
    CEP_End VARCHAR(10) NOT NULL,
    Bairro_End VARCHAR(100) NOT NULL,
    Estado_End VARCHAR(100) NOT NULL,
    Cidade_End VARCHAR(100) NOT NULL,
    Matricula_Emp INT,
    cod_Clientes INT,
    CONSTRAINT FK_End_Cli FOREIGN KEY (cod_Clientes)
    REFERENCES Clientes(cod_Cliente),
    CONSTRAINT FK_End_Emp FOREIGN KEY (Matricula_Emp)
    REFERENCES Empregados(Matricula_Empre)

INSERT INTO Enderecos (Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula_Emp, cod_Clientes)
VALUES (123, 'Residencial', 'Rua das Flores', 'Apto 201', '12345-678', 'Centro', 'SP', 'São Paulo', 1, 1);

INSERT INTO Enderecos (Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula_Emp, cod_Clientes)
VALUES (456, 'Comercial', 'Avenida Paulista', 'Conjunto 1502', '98765-432', 'Bela Vista', 'SP', 'São Paulo', 2, 2);

INSERT INTO Enderecos (Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula_Emp, cod_Clientes)
VALUES (789, 'Residencial', 'Rua dos Pinheiros', NULL, '54321-987', 'Pinheiros', 'SP', 'São Paulo', NULL, 3);

INSERT INTO Enderecos (Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula_Emp, cod_Clientes)
VALUES (321, 'Comercial', 'Rua Boa Vista', 'Sala 202', '65432-109', 'Sé', 'SP', 'São Paulo', 3, NULL);

INSERT INTO Enderecos (Num_End, Tipo_End, Logradouro_End, Complemento, CEP_End, Bairro_End, Estado_End, Cidade_End, Matricula_Emp, cod_Clientes)
VALUES (654, 'Residencial', 'Avenida Brasil', NULL, '67890-123', 'Jardim América', 'RJ', 'Rio de Janeiro', NULL, 4);

UPDATE Enderecos
SET Bairro_End = 'Vila Mariana', Complemento = 'Casa'
WHERE ID_Enderecos = 3;

UPDATE Enderecos
SET Matricula_Emp = 4
WHERE ID_Enderecos = 4;

DELETE FROM Enderecos
WHERE ID_Enderecos = 2;
);

CREATE TABLE IF NOT EXISTS Empregados(
    Matricula_Empre INT PRIMARY KEY,
    Nome_Empre VARCHAR(200) NOT NULL,
    Cargo_Empre VARCHAR(100) NOT NULL,
    Salario_Empre DECIMAL(10, 2) NOT NULL,
    Data_Adimissao_Empre DATE NOT NULL,
    Qualificacoes_Empre TEXT,
    ID_Endereco INT,
    CONSTRAINT FK_Empregados FOREIGN KEY(ID_Endereco)
    REFERENCES Enderecos(ID_Enderecos)

INSERT INTO Empregados (Nome_Empre, Cargo_Empre, Salario_Empre, Data_Adimissao_Empre, Qualificacoes_Empre, ID_Endereco)
VALUES ('João Silva', 'Gerente de Vendas', 5500.00, '2020-03-15', 'MBA em Gestão Comercial', 1);

INSERT INTO Empregados (Nome_Empre, Cargo_Empre, Salario_Empre, Data_Adimissao_Empre, Qualificacoes_Empre, ID_Endereco)
VALUES ('Maria Oliveira', 'Analista de Marketing', 4200.00, '2021-06-01', 'Especialização em Marketing Digital', 2);

INSERT INTO Empregados (Nome_Empre, Cargo_Empre, Salario_Empre, Data_Adimissao_Empre, Qualificacoes_Empre, ID_Endereco)
VALUES ('Carlos Pereira', 'Desenvolvedor de Software', 6500.00, '2019-11-25', 'Certificação em Python e Java', 3);

INSERT INTO Empregados (Nome_Empre, Cargo_Empre, Salario_Empre, Data_Adimissao_Empre, Qualificacoes_Empre, ID_Endereco)
VALUES ('Ana Souza', 'Designer Gráfico', 4000.00, '2022-01-15', 'Curso Avançado em Adobe Suite', 4);

INSERT INTO Empregados (Nome_Empre, Cargo_Empre, Salario_Empre, Data_Adimissao_Empre, Qualificacoes_Empre, ID_Endereco)
VALUES ('Pedro Lima', 'Assistente Administrativo', 3200.00, '2023-07-10', 'Excel Avançado e Noções de RH', 5);

UPDATE Empregados
SET Salario_Empre = 6000.00
WHERE Matricula_Empre = 3;

UPDATE Empregados
SET Cargo_Empre = 'Coordenador de Projetos', Qualificacoes_Empre = 'Gestão de Projetos e Scrum'
WHERE Matricula_Empre = 2;

DELETE FROM Empregados
WHERE Matricula_Empre = 4;
);

ALTER TABLE Empregados
MODIFY COLUMN Cargo_Empre VARCHAR(50) NOT NULL;

CREATE TABLE IF NOT EXISTS Telefone(
    cod_Tel INT PRIMARY KEY,
    Tel_Fixo VARCHAR(15),
    Tel_Cel VARCHAR(15),
    Matricula_Emp INT,
    CNPJ_Fornecedores_Tel VARCHAR(18),
    CONSTRAINT FK_Tel_Emp FOREIGN KEY(Matricula_Emp)
    REFERENCES Empregados(Matricula_Empre),
    CONSTRAINT FK_Tel_Forn FOREIGN KEY(CNPJ_Fornecedores_Tel)
    REFERENCES Empresas(CNPJ_Empresas)

INSERT INTO Telefone (Tel_Fixo, Tel_Cel, Matricula_Emp, CNPJ_Fornecedores_Tel)
VALUES ('(11) 3003-4000', '(11) 99999-8888', 1, '12.345.678/0001-90');

INSERT INTO Telefone (Tel_Fixo, Tel_Cel, Matricula_Emp, CNPJ_Fornecedores_Tel)
VALUES ('(21) 4004-5000', '(21) 98888-7777', 2, '98.765.432/0001-09');

INSERT INTO Telefone (Tel_Fixo, Tel_Cel, Matricula_Emp, CNPJ_Fornecedores_Tel)
VALUES ('(31) 3500-2500', NULL, 3, '55.123.456/0001-78');

INSERT INTO Telefone (Tel_Fixo, Tel_Cel, Matricula_Emp, CNPJ_Fornecedores_Tel)
VALUES (NULL, '(41) 97777-5555', NULL, '23.456.789/0001-67');

INSERT INTO Telefone (Tel_Fixo, Tel_Cel, Matricula_Emp, CNPJ_Fornecedores_Tel)
VALUES ('(51) 2200-3300', '(51) 96666-4444', 4, '67.890.123/0001-45');

UPDATE Telefone
SET Tel_Cel = '(11) 98888-6666'
WHERE cod_Tel = 1;

UPDATE Telefone
SET Tel_Fixo = '(21) 4500-5500'
WHERE CNPJ_Fornecedores_Tel = '98.765.432/0001-09';

DELETE FROM Telefone
WHERE cod_Tel = 4;
);

CREATE TABLE IF NOT EXISTS Fornecedores(
    CNPJ_Fornecedores VARCHAR(18) PRIMARY KEY,
    P_Contato_Fornecedores VARCHAR(300) NOT NULL

INSERT INTO Fornecedores (CNPJ_Fornecedores, P_Contato_Fornecedores)
VALUES ('12.345.678/0001-90', 'João da Silva');

INSERT INTO Fornecedores (CNPJ_Fornecedores, P_Contato_Fornecedores)
VALUES ('98.765.432/0001-09', 'Maria Oliveira');

INSERT INTO Fornecedores (CNPJ_Fornecedores, P_Contato_Fornecedores)
VALUES ('55.123.456/0001-78', 'Carlos Pereira');

INSERT INTO Fornecedores (CNPJ_Fornecedores, P_Contato_Fornecedores)
VALUES ('23.456.789/0001-67', 'Ana Souza');

INSERT INTO Fornecedores (CNPJ_Fornecedores, P_Contato_Fornecedores)
VALUES ('67.890.123/0001-45', 'Pedro Lima');

UPDATE Fornecedores
SET P_Contato_Fornecedores = 'Lucas Mendes'
WHERE CNPJ_Fornecedores = '12.345.678/0001-90';

UPDATE Fornecedores
SET P_Contato_Fornecedores = 'Fernanda Ribeiro'
WHERE CNPJ_Fornecedores = '98.765.432/0001-09';

DELETE FROM Fornecedores
WHERE CNPJ_Fornecedores = '23.456.789/0001-67';
);

ALTER TABLE Fornecedores
CHANGE COLUMN CNPJ_Fornecedores Fornecedores_CNPJ VARCHAR(18);

CREATE TABLE IF NOT EXISTS Empresas(
    CNPJ_Empresas VARCHAR(18) PRIMARY KEY,
    Razao_Social VARCHAR(50),
    P_Contato_Empresas VARCHAR(100),
    CNPJ_Fornecedores_Emp VARCHAR(18),
    CONSTRAINT FK_Emp_Forne FOREIGN KEY(CNPJ_Fornecedores_Emp)
    REFERENCES Fornecedores(CNPJ_Fornecedores)

INSERT INTO Empresas (CNPJ_Empresas, Razao_Social, P_Contato_Empresas, CNPJ_Fornecedores_Emp)
VALUES ('12345678000195', 'Empresa A Ltda', 'João Silva', '98765432000123');

INSERT INTO Empresas (CNPJ_Empresas, Razao_Social, P_Contato_Empresas, CNPJ_Fornecedores_Emp)
VALUES ('23456789000187', 'Empresa B Ltda', 'Maria Oliveira', '87654321000134');

INSERT INTO Empresas (CNPJ_Empresas, Razao_Social, P_Contato_Empresas, CNPJ_Fornecedores_Emp)
VALUES ('34567890000123', 'Empresa C S/A', 'Carlos Pereira', '76543210000145');

INSERT INTO Empresas (CNPJ_Empresas, Razao_Social, P_Contato_Empresas, CNPJ_Fornecedores_Emp)
VALUES ('45678901000156', 'Empresa D Ltda', 'Ana Souza', '65432109000156');

INSERT INTO Empresas (CNPJ_Empresas, Razao_Social, P_Contato_Empresas, CNPJ_Fornecedores_Emp)
VALUES ('56789012000167', 'Empresa E Ltda', 'Paulo Santos', '54321098000167');

UPDATE Empresas
SET Razao_Social = 'Nova Empresa A Ltda'
WHERE CNPJ_Empresas = '12345678000195';

UPDATE Empresas
SET P_Contato_Empresas = 'Joana Silva'
WHERE CNPJ_Empresas = '23456789000187';

DELETE FROM Empresas
WHERE CNPJ_Empresas = '34567890000123';
);

CREATE TABLE IF NOT EXISTS Produtos(
    Cod_Produtos INT PRIMARY KEY,
    Nome_Produtos VARCHAR(50) NOT NULL,
    Cor_Produtos VARCHAR (20) NOT NULL,
    Dimensoes_Produtos FLOAT NOT NULL,
    Peso_Produtos FLOAT NOT NULL,
    Preco_Produtos FLOAT NOT NULL,
    Tempo_Fabri_Produtos TIME NOT NULL,
    #Perguntar ao professor sobre o desenho.
    Desenho_Produtos INT,
    Cod_RS_Prod INT,
    CONSTRAINT FK_RS_Prod FOREIGN KEY (Cod_RS_Prod)
    REFERENCES Registro_Suprimentos(Cod_RS)

INSERT INTO Produtos (Cod_Produtos, Nome_Produtos, Cor_Produtos, Dimensoes_Produtos, Peso_Produtos, Preco_Produtos, Tempo_Fabri_Produtos, Desenho_Produtos, Cod_RS_Prod)
VALUES (1, 'Produto A', 'Azul', '10x20x30 cm', 1.5, 50.00, 5, 'Desenho_A.pdf', 101);

INSERT INTO Produtos (Cod_Produtos, Nome_Produtos, Cor_Produtos, Dimensoes_Produtos, Peso_Produtos, Preco_Produtos, Tempo_Fabri_Produtos, Desenho_Produtos, Cod_RS_Prod)
VALUES (2, 'Produto B', 'Vermelho', '15x25x35 cm', 2.0, 75.00, 7, 'Desenho_B.pdf', 102);

INSERT INTO Produtos (Cod_Produtos, Nome_Produtos, Cor_Produtos, Dimensoes_Produtos, Peso_Produtos, Preco_Produtos, Tempo_Fabri_Produtos, Desenho_Produtos, Cod_RS_Prod)
VALUES (3, 'Produto C', 'Verde', '20x30x40 cm', 2.5, 100.00, 10, 'Desenho_C.pdf', 103);

INSERT INTO Produtos (Cod_Produtos, Nome_Produtos, Cor_Produtos, Dimensoes_Produtos, Peso_Produtos, Preco_Produtos, Tempo_Fabri_Produtos, Desenho_Produtos, Cod_RS_Prod)
VALUES (4, 'Produto D', 'Preto', '5x15x20 cm', 1.2, 40.00, 3, 'Desenho_D.pdf', 104);

INSERT INTO Produtos (Cod_Produtos, Nome_Produtos, Cor_Produtos, Dimensoes_Produtos, Peso_Produtos, Preco_Produtos, Tempo_Fabri_Produtos, Desenho_Produtos, Cod_RS_Prod)
VALUES (5, 'Produto E', 'Branco', '25x35x45 cm', 3.0, 120.00, 15, 'Desenho_E.pdf', 105);

UPDATE Produtos
SET Preco_Produtos = 55.00
WHERE Cod_Produtos = 1;

UPDATE Produtos
SET Tempo_Fabri_Produtos = 6
WHERE Cod_Produtos = 2;

DELETE FROM Produtos
WHERE Cod_Produtos = 3;
);

CREATE TABLE IF NOT EXISTS Registro_Suprimentos(
    Cod_RS INT PRIMARY KEY,
    Quantidade_RS INT,
    Data_Necessidade_RS DATE

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (1, 500, '2024-12-01');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (2, 1000, '2024-12-10');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (3, 200, '2024-11-25');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (4, 1500, '2024-12-20');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (5, 300, '2024-12-15');

UPDATE Registro_Suprimentos
SET Quantidade_RS = 600
WHERE Cod_RS = 1;

UPDATE Registro_Suprimentos
SET Data_Necessidade_RS = '2024-12-05'
WHERE Cod_RS = 2;

DELETE FROM Registro_Suprimentos
WHERE Cod_RS = 3;
);

CREATE TABLE IF NOT EXISTS Componentes(
    Cod_Componentes INT PRIMARY KEY,
    Nome_Componentes VARCHAR(100),
    Tipo_Componentes VARCHAR(100),
    QTD_Estoque_Componentes INT NOT,
    Preco_Unit_Componentes DECIMAL(10, 2),
    #Unidade_Componente O que seria?
    Unidade_Componente VARCHAR(50)

INSERT INTO Componentes (Cod_Componentes, Nome_Componentes, Tipo_Componentes, QTD_Estoque_Componentes, Preco_Unit_Componentes, Unidade_Componente)
VALUES (1, 'Resistor 10kΩ', 'Eletrônico', 500, 0.05, 'Unidade');

INSERT INTO Componentes (Cod_Componentes, Nome_Componentes, Tipo_Componentes, QTD_Estoque_Componentes, Preco_Unit_Componentes, Unidade_Componente)
VALUES (2, 'Parafuso M6', 'Mecânico', 2000, 0.10, 'Unidade');

INSERT INTO Componentes (Cod_Componentes, Nome_Componentes, Tipo_Componentes, QTD_Estoque_Componentes, Preco_Unit_Componentes, Unidade_Componente)
VALUES (3, 'Placa de Circuito', 'Eletrônico', 150, 5.00, 'Unidade')

INSERT INTO Componentes (Cod_Componentes, Nome_Componentes, Tipo_Componentes, QTD_Estoque_Componentes, Preco_Unit_Componentes, Unidade_Componente)
VALUES (4, 'Motor Elétrico', 'Mecânico', 80, 50.00, 'Unidade');

INSERT INTO Componentes (Cod_Componentes, Nome_Componentes, Tipo_Componentes, QTD_Estoque_Componentes, Preco_Unit_Componentes, Unidade_Componente)
VALUES (5, 'Fio de Cobre', 'Eletrônico', 1000, 0.20, 'Metro');

UPDATE Componentes
SET QTD_Estoque_Componentes = 600
WHERE Cod_Componentes = 1;

UPDATE Componentes
SET Preco_Unit_Componentes = 0.08
WHERE Cod_Componentes = 2;

DELETE FROM Componentes
WHERE Cod_Componentes = 3;
);

CREATE TABLE IF NOT EXISTS Maquinas(
    Cod_Maquina INT PRIMARY KEY,
    Temp_Vida_Maquina INT,
    Data_Compra_Maquina DATE,
    Data_Fim_Garan_Maquina DATE,
    Cod_RM_Maq INT,
    CONSTRAINT FK_RM_Maq FOREIGN KEY (Cod_RM_Maq)
    REFERENCES Registro_Manutencao(Cod_RM)

INSERT INTO Maquinas (Cod_Maquina, Temp_Vida_Maquina, Data_Compra_Maquina, Data_Fim_Garan_Maquina, Cod_RM_Maq)
VALUES (1, 10, '2024-01-10', '2026-01-10', 1);

INSERT INTO Maquinas (Cod_Maquina, Temp_Vida_Maquina, Data_Compra_Maquina, Data_Fim_Garan_Maquina, Cod_RM_Maq)
VALUES (2, 8, '2023-07-15', '2025-07-15', 2);

INSERT INTO Maquinas (Cod_Maquina, Temp_Vida_Maquina, Data_Compra_Maquina, Data_Fim_Garan_Maquina, Cod_RM_Maq)
VALUES (3, 12, '2022-03-22', '2024-03-22', 3);

INSERT INTO Maquinas (Cod_Maquina, Temp_Vida_Maquina, Data_Compra_Maquina, Data_Fim_Garan_Maquina, Cod_RM_Maq)
VALUES (4, 15, '2021-08-30', '2024-08-30', 4);

INSERT INTO Maquinas (Cod_Maquina, Temp_Vida_Maquina, Data_Compra_Maquina, Data_Fim_Garan_Maquina, Cod_RM_Maq)
VALUES (5, 20, '2020-11-05', '2025-11-05', 5);

UPDATE Maquinas
SET Temp_Vida_Maquina = 18
WHERE Cod_Maquina = 1;

UPDATE Maquinas
SET Data_Fim_Garan_Maquina = '2026-12-10'
WHERE Cod_Maquina = 2;

DELETE FROM Maquinas
WHERE Cod_Maquina = 3;
);

CREATE TABLE IF NOT EXISTS Recursos_Especificos_RE(
    Cod_RE INT PRIMARY KEY,
    Quant_Necessaria INT,
    Unidade_RE VARCHAR(21) NOT NULL,
    Tempo_Uso INT,
    Horas_Trabalho_RE INT,
    Horas_Mao_Obra INT

INSERT INTO Recursos_Especificos_RE (Cod_RE, Quant_Necessaria, Unidade_RE, Tempo_Uso, Horas_Trabalho_RE, Horas_Mao_Obra)
VALUES (1, 52, 'Peças', 10, 40, 8);

INSERT INTO Recursos_Especificos_RE (Cod_RE, Quant_Necessaria, Unidade_RE, Tempo_Uso, Horas_Trabalho_RE, Horas_Mao_Obra)
VALUES (2, 100, 'Litros', 20, 80, 16);

INSERT INTO Recursos_Especificos_RE (Cod_RE, Quant_Necessaria, Unidade_RE, Tempo_Uso, Horas_Trabalho_RE, Horas_Mao_Obra)
VALUES (3, 200, 'Metros', 30, 120, 24);

INSERT INTO Recursos_Especificos_RE (Cod_RE, Quant_Necessaria, Unidade_RE, Tempo_Uso, Horas_Trabalho_RE, Horas_Mao_Obra)
VALUES (4, 300, 'Unidades', 40, 160, 32);

INSERT INTO Recursos_Especificos_RE (Cod_RE, Quant_Necessaria, Unidade_RE, Tempo_Uso, Horas_Trabalho_RE, Horas_Mao_Obra)
VALUES (5, 150, 'Peças', 15, 60, 12);

UPDATE Recursos_Especificos_RE
SET Quant_Necessaria = 60
WHERE Cod_RE = 1;

UPDATE Recursos_Especificos_RE
SET Tempo_Uso = 25
WHERE Cod_RE = 2;

DELETE FROM Recursos_Especificos_RE
WHERE Cod_RE = 3;
);

CREATE TABLE IF NOT EXISTS Registro_Manutencao(
    Cod_RM INT PRIMARY KEY,
    Data_RM DATE NOT NULL,
    Descricao_RM TEXT NOT NULL,
    Cod_Maq_RM INT,
    CONSTRAINT FK_Maq_RM FOREIGN KEY(Cod_Maq_RM)
    REFERENCES Maquinas(Cod_Maquina)

INSERT INTO Registro_Manutencao (Cod_RM, Data_RM, Descricao_RM, Cod_Maq_RM)
VALUES (1, '2024-11-01', 'Troca de óleo e filtro', 101);

INSERT INTO Registro_Manutencao (Cod_RM, Data_RM, Descricao_RM, Cod_Maq_RM)
VALUES (2, '2024-11-05', 'Reparo na correia de transmissão', 102);

INSERT INTO Registro_Manutencao (Cod_RM, Data_RM, Descricao_RM, Cod_Maq_RM)
VALUES (3, '2024-11-10', 'Substituição de peças do motor', 103);

INSERT INTO Registro_Manutencao (Cod_RM, Data_RM, Descricao_RM, Cod_Maq_RM)
VALUES (4, '2024-11-12', 'Ajuste de calibragem e verificação de sensores', 104);

INSERT INTO Registro_Manutencao (Cod_RM, Data_RM, Descricao_RM, Cod_Maq_RM)
VALUES (5, '2024-11-15', 'Limpeza e manutenção preventiva', 105);

UPDATE Registro_Manutencao
SET Descricao_RM = 'Substituição do filtro de ar e ajuste no sistema hidráulico'
WHERE Cod_RM = 1;

UPDATE Registro_Manutencao
SET Data_RM = '2024-11-18'
WHERE Cod_RM = 2;

DELETE FROM Registro_Manutencao
WHERE Cod_RM = 3;
);

CREATE TABLE IF NOT EXISTS Registro_Suprimentos(
    Cod_RS INT PRIMARY KEY,
    Quantidade_RS INT,
    Data_Necessidade_RS DATE

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (1, 100, '2024-12-01');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (2, 200, '2024-12-05');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (3, 150, '2024-12-10');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (4, 80, '2024-12-15');

INSERT INTO Registro_Suprimentos (Cod_RS, Quantidade_RS, Data_Necessidade_RS)
VALUES (5, 120, '2024-12-20');

UPDATE Registro_Suprimentos
SET Quantidade_RS = 180
WHERE Cod_RS = 1;

UPDATE Registro_Suprimentos
SET Data_Necessidade_RS = '2024-12-25'
WHERE Cod_RS = 2;

DELETE FROM Registro_Suprimentos
WHERE Cod_RS = 3;
);
DROP TABLE Registro_Suprimentos;

CREATE TABLE IF NOT EXISTS Empregados_Produtos(
    Matricula_Empre_EMPR INT,
    Cod_Produtos_EMPR INT,
    PRIMARY KEY(Matricula_Empre_EMPR, Cod_Produtos),
    CONSTRAINT FK_Empregados_Produtos FOREIGN KEY(Matricula_Empre_EMPR)
    REFERENCES Empregados(Matricula_Empre),
    CONSTRAINT FK_Produtos_Empregados FOREIGN KEY(Cod_Produtos_EMPR)
    REFERENCES Produtos(Cod_Produtos)

INSERT INTO Empregados_Produtos (Matricula_Empre_EMPR, Cod_Produtos_EMPR)
VALUES (1, 101);

INSERT INTO Empregados_Produtos (Matricula_Empre_EMPR, Cod_Produtos_EMPR)
VALUES (2, 102);

INSERT INTO Empregados_Produtos (Matricula_Empre_EMPR, Cod_Produtos_EMPR)
VALUES (3, 103);

INSERT INTO Empregados_Produtos (Matricula_Empre_EMPR, Cod_Produtos_EMPR)
VALUES (4, 104);

INSERT INTO Empregados_Produtos (Matricula_Empre_EMPR, Cod_Produtos_EMPR)
VALUES (5, 105);

UPDATE Empregados_Produtos
SET Cod_Produtos_EMPR = 106
WHERE Matricula_Empre_EMPR = 1 AND Cod_Produtos_EMPR = 101;

UPDATE Empregados_Produtos
SET Matricula_Empre_EMPR = 6
WHERE Matricula_Empre_EMPR = 2 AND Cod_Produtos_EMPR = 102;

DELETE FROM Empregados_Produtos
WHERE Matricula_Empre_EMPR = 3 AND Cod_Produtos_EMPR = 103;
);

CREATE TABLE IF NOT EXISTS Clientes_Empresas(
    cod_Cliente INT,
    CNPJ_Empresas VARCHAR(18),
    PRIMARY KEY(cod_Cliente, CNPJ_Empresas),
    CONSTRAINT FK_Clientes_Empresas FOREIGN KEY(cod_Cliente)
    REFERENCES Clientes(cod_Cliente),
    CONSTRAINT FK_Empresas_Clientes FOREIGN KEY(CNPJ_Empresas)
    REFERENCES Empresas(CNPJ_Empresas)

INSERT INTO Clientes_Empresas (cod_Cliente, CNPJ_Empresas)
VALUES (1, '12.345.678/0001-99');

INSERT INTO Clientes_Empresas (cod_Cliente, CNPJ_Empresas)
VALUES (2, '98.765.432/0001-88');

INSERT INTO Clientes_Empresas (cod_Cliente, CNPJ_Empresas)
VALUES (3, '11.223.344/0001-77');

INSERT INTO Clientes_Empresas (cod_Cliente, CNPJ_Empresas)
VALUES (4, '22.334.455/0001-66');

INSERT INTO Clientes_Empresas (cod_Cliente, CNPJ_Empresas)
VALUES (5, '33.445.556/0001-55');

UPDATE Clientes_Empresas
SET CNPJ_Empresas = '44.556.667/0001-44'
WHERE cod_Cliente = 1 AND CNPJ_Empresas = '12.345.678/0001-99';

UPDATE Clientes_Empresas
SET cod_Cliente = 6
WHERE cod_Cliente = 2 AND CNPJ_Empresas = '98.765.432/0001-88';

DELETE FROM Clientes_Empresas
WHERE cod_Cliente = 3 AND CNPJ_Empresas = '11.223.344/0001-77';
);

CREATE TABLE IF NOT EXISTS Componentes_Fornecedores(
    Cod_Componentes INT,
    CNPJ_Fornecedores VARCHAR(18),
    PRIMARY KEY(Cod_Componentes, CNPJ_Fornecedores),
    CONSTRAINT FK_Componentes_Fornecedores FOREIGN KEY(Cod_Componentes)
    REFERENCES Componentes(Cod_Componentes),
    CONSTRAINT FK_Fornecedores_Componentes FOREIGN KEY(CNPJ_Fornecedores)
    REFERENCES Fornecedores(CNPJ_Fornecedores)

INSERT INTO Componentes_Fornecedores (Cod_Componentes, CNPJ_Fornecedores)
VALUES (1, '12.345.678/0001-99');

INSERT INTO Componentes_Fornecedores (Cod_Componentes, CNPJ_Fornecedores)
VALUES (2, '98.765.432/0001-88');

INSERT INTO Componentes_Fornecedores (Cod_Componentes, CNPJ_Fornecedores)
VALUES (3, '11.223.344/0001-77');

INSERT INTO Componentes_Fornecedores (Cod_Componentes, CNPJ_Fornecedores)
VALUES (4, '22.334.455/0001-66');

INSERT INTO Componentes_Fornecedores (Cod_Componentes, CNPJ_Fornecedores)
VALUES (5, '33.445.556/0001-55');

UPDATE Componentes_Fornecedores
SET CNPJ_Fornecedores = '44.556.667/0001-44'
WHERE Cod_Componentes = 1 AND CNPJ_Fornecedores = '12.345.678/0001-99';

UPDATE Componentes_Fornecedores
SET Cod_Componentes = 6
WHERE Cod_Componentes = 2 AND CNPJ_Fornecedores = '98.765.432/0001-88';

DELETE FROM Componentes_Fornecedores
WHERE Cod_Componentes = 3 AND CNPJ_Fornecedores = '11.223.344/0001-77';
);


CREATE TABLE IF NOT EXISTS Enderecos_Empresas(
    ID_Enderecos INT,
    CNPJ_Empresas VARCHAR(18),
    PRIMARY KEY(ID_Enderecos, CNPJ_Empresas),
    CONSTRAINT FK_Enderecos_Empresas FOREIGN KEY(ID_Enderecos)
    REFERENCES Enderecos(ID_Enderecos),
    CONSTRAINT FK_Empresas_Enderecos FOREIGN KEY(CNPJ_Empresas)
    REFERENCES Empresas(CNPJ_Empresas)

INSERT INTO Enderecos_Empresas (ID_Enderecos, CNPJ_Empresas)
VALUES (1, '12.345.678/0001-99');

INSERT INTO Enderecos_Empresas (ID_Enderecos, CNPJ_Empresas)
VALUES (2, '98.765.432/0001-88');

INSERT INTO Enderecos_Empresas (ID_Enderecos, CNPJ_Empresas)
VALUES (3, '11.223.344/0001-77');

INSERT INTO Enderecos_Empresas (ID_Enderecos, CNPJ_Empresas)
VALUES (4, '22.334.455/0001-66');

INSERT INTO Enderecos_Empresas (ID_Enderecos, CNPJ_Empresas)
VALUES (5, '33.445.556/0001-55');

UPDATE Enderecos_Empresas
SET CNPJ_Empresas = '44.556.667/0001-44'
WHERE ID_Enderecos = 1 AND CNPJ_Empresas = '12.345.678/0001-99';

UPDATE Enderecos_Empresas
SET ID_Enderecos = 6
WHERE ID_Enderecos = 2 AND CNPJ_Empresas = '98.765.432/0001-88';

DELETE FROM Enderecos_Empresas
WHERE ID_Enderecos = 3 AND CNPJ_Empresas = '11.223.344/0001-77';
);

CREATE TABLE IF NOT EXISTS Endereço_Fornecedores(
    ID_Enderecos INT,
    CNPJ_Fornecedores VARCHAR(18),
    PRIMARY KEY(ID_Enderecos, CNPJ_Fornecedores),
    CONSTRAINT FK_Endereço_Fornecedores FOREIGN KEY(CNPJ_Fornecedores)
    REFERENCES Fornecedores(CNPJ_Fornecedores),
    CONSTRAINT FK_Fornecedores_Enderecos FOREIGN KEY(ID_Enderecos)
    REFERENCES Enderecos(ID_Enderecos)

INSERT INTO Endereco_Fornecedores (ID_Enderecos, CNPJ_Fornecedores)
VALUES (1, '12.345.678/0001-99');

INSERT INTO Endereco_Fornecedores (ID_Enderecos, CNPJ_Fornecedores)
VALUES (2, '98.765.432/0001-88');

INSERT INTO Endereco_Fornecedores (ID_Enderecos, CNPJ_Fornecedores)
VALUES (3, '11.223.344/0001-77');

INSERT INTO Endereco_Fornecedores (ID_Enderecos, CNPJ_Fornecedores)
VALUES (4, '22.334.455/0001-66');

INSERT INTO Endereco_Fornecedores (ID_Enderecos, CNPJ_Fornecedores)
VALUES (5, '33.445.556/0001-55');

UPDATE Endereco_Fornecedores
SET CNPJ_Fornecedores = '44.556.667/0001-44'
WHERE ID_Enderecos = 1 AND CNPJ_Fornecedores = '12.345.678/0001-99';

UPDATE Endereco_Fornecedores
SET ID_Enderecos = 6
WHERE ID_Enderecos = 2 AND CNPJ_Fornecedores = '98.765.432/0001-88';

DELETE FROM Endereco_Fornecedores
WHERE ID_Enderecos = 3 AND CNPJ_Fornecedores = '11.223.344/0001-77';
);

CREATE TABLE IF NOT EXISTS Encomendas_Produtos(
    Num_Encomendas INT,
    Cod_Produtos_EMPR INT,
    PRIMARY KEY(Num_Encomendas, Cod_Produtos_EMPR),
    CONSTRAINT FK_Encomendas_Produtos FOREIGN KEY(Num_Encomendas)
    REFERENCES Encomendas(Num_Encomendas),
    CONSTRAINT FK_Produtos_Encomendas FOREIGN KEY(Cod_Produtos_EMPR)
    REFERENCES Produtos(Cod_Produtos)

INSERT INTO Encomendas_Produtos (Num_Encomendas, Cod_Produtos_EMPR)
VALUES (1001, 101);

INSERT INTO Encomendas_Produtos (Num_Encomendas, Cod_Produtos_EMPR)
VALUES (1002, 102);

INSERT INTO Encomendas_Produtos (Num_Encomendas, Cod_Produtos_EMPR)
VALUES (1003, 103);

INSERT INTO Encomendas_Produtos (Num_Encomendas, Cod_Produtos_EMPR)
VALUES (1004, 104);

INSERT INTO Encomendas_Produtos (Num_Encomendas, Cod_Produtos_EMPR)
VALUES (1005, 105);

UPDATE Encomendas_Produtos
SET Cod_Produtos_EMPR = 106
WHERE Num_Encomendas = 1001 AND Cod_Produtos_EMPR = 101;

UPDATE Encomendas_Produtos
SET Num_Encomendas = 1006
WHERE Num_Encomendas = 1002 AND Cod_Produtos_EMPR = 102;

DELETE FROM Encomendas_Produtos
WHERE Num_Encomendas = 1003 AND Cod_Produtos_EMPR = 103;
);

CREATE TABLE IF NOT EXISTS Componentes_Produtos(
    Cod_Componentes INT,
    Cod_Produtos_EMPR INT,
    PRIMARY KEY(Cod_Componentes, Cod_Produtos_EMPR),
    CONSTRAINT FK_Produtos_Componentes FOREIGN KEY(Cod_Componentes)
    REFERENCES Componentes(Cod_Componentes),
    CONSTRAINT FK_Componentes_Produtos FOREIGN KEY(Cod_Produtos_EMPR)
    REFERENCES Produtos(Cod_Produtos)

INSERT INTO Componentes_Produtos (Cod_Componentes, Cod_Produtos_EMPR)
VALUES (1, 101);

INSERT INTO Componentes_Produtos (Cod_Componentes, Cod_Produtos_EMPR)
VALUES (2, 102);

INSERT INTO Componentes_Produtos (Cod_Componentes, Cod_Produtos_EMPR)
VALUES (3, 103);

INSERT INTO Componentes_Produtos (Cod_Componentes, Cod_Produtos_EMPR)
VALUES (4, 104);

INSERT INTO Componentes_Produtos (Cod_Componentes, Cod_Produtos_EMPR)
VALUES (5, 105);

UPDATE Componentes_Produtos
SET Cod_Produtos_EMPR = 106
WHERE Cod_Componentes = 1 AND Cod_Produtos_EMPR = 101;

UPDATE Componentes_Produtos
SET Cod_Componentes = 6
WHERE Cod_Componentes = 2 AND Cod_Produtos_EMPR = 102;

DELETE FROM Componentes_Produtos
WHERE Cod_Componentes = 3 AND Cod_Produtos_EMPR = 103;
);

CREATE TABLE IF NOT EXISTS Componentes_RE(
    Cod_Componentes INT,
    Cod_RE INT,
    PRIMARY KEY(Cod_Componentes, Cod_RE),
    CONSTRAINT FK_RE_Componentes FOREIGN KEY(Cod_Componentes)
    REFERENCES Componentes(Cod_Componentes),
    CONSTRAINT FK_Componentes_RE FOREIGN KEY(Cod_RE)
    REFERENCES Recursos_Especificos_RE(Cod_RE)

INSERT INTO Componentes_RE (Cod_Componentes, Cod_RE)
VALUES (1, 1001);

INSERT INTO Componentes_RE (Cod_Componentes, Cod_RE)
VALUES (2, 1002);

INSERT INTO Componentes_RE (Cod_Componentes, Cod_RE)
VALUES (3, 1003);

INSERT INTO Componentes_RE (Cod_Componentes, Cod_RE)
VALUES (4, 1004);

INSERT INTO Componentes_RE (Cod_Componentes, Cod_RE)
VALUES (5, 1005);

UPDATE Componentes_RE
SET Cod_RE = 2001
WHERE Cod_Componentes = 1 AND Cod_RE = 1001;

UPDATE Componentes_RE
SET Cod_Componentes = 6
WHERE Cod_Componentes = 2 AND Cod_RE = 1002;

DELETE FROM Componentes_RE
WHERE Cod_Componentes = 3 AND Cod_RE = 1003;
);

CREATE TABLE IF NOT EXISTS Clientes_Telefone(
    cod_Cliente INT,
    cod_Tel INT,
    PRIMARY KEY(cod_Cliente, cod_Tel),
    CONSTRAINT FK_Clientes_Telefone FOREIGN KEY(cod_Cliente)
    REFERENCES Clientes(cod_Cliente),
    CONSTRAINT FK_Telefone_Clientes FOREIGN KEY(cod_Tel)
    REFERENCES Telefone(cod_Tel)

INSERT INTO Clientes_Telefone (cod_Cliente, cod_Tel)
VALUES (1, 101);

INSERT INTO Clientes_Telefone (cod_Cliente, cod_Tel)
VALUES (2, 102);

INSERT INTO Clientes_Telefone (cod_Cliente, cod_Tel)
VALUES (3, 103);

INSERT INTO Clientes_Telefone (cod_Cliente, cod_Tel)
VALUES (4, 104);

INSERT INTO Clientes_Telefone (cod_Cliente, cod_Tel)
VALUES (5, 105);

UPDATE Clientes_Telefone
SET cod_Tel = 106
WHERE cod_Cliente = 1 AND cod_Tel = 101;

UPDATE Clientes_Telefone
SET cod_Cliente = 6
WHERE cod_Cliente = 2 AND cod_Tel = 102;

DELETE FROM Clientes_Telefone
WHERE cod_Cliente = 3 AND cod_Tel = 103;
);

CREATE TABLE IF NOT EXISTS Empregados_Telefone(
    Matricula_Empre INT,
    cod_Tel INT,
    PRIMARY KEY(Matricula_Empre, cod_Tel),
    CONSTRAINT FK_Empregados_Telefone FOREIGN KEY(Matricula_Empre)
    REFERENCES Empregados(Matricula_Empre),
    CONSTRAINT FK_Telefone_Empregados FOREIGN KEY(cod_Tel)
    REFERENCES Telefone(cod_Tel)

INSERT INTO Empregados_Telefone (Matricula_Empre, cod_Tel)
VALUES (1, 101);

INSERT INTO Empregados_Telefone (Matricula_Empre, cod_Tel)
VALUES (2, 102);

INSERT INTO Empregados_Telefone (Matricula_Empre, cod_Tel)
VALUES (3, 103);

INSERT INTO Empregados_Telefone (Matricula_Empre, cod_Tel)
VALUES (4, 104);

INSERT INTO Empregados_Telefone (Matricula_Empre, cod_Tel)
VALUES (5, 105);

UPDATE Empregados_Telefone
SET cod_Tel = 106
WHERE Matricula_Empre = 1 AND cod_Tel = 101;

UPDATE Empregados_Telefone
SET Matricula_Empre = 6
WHERE Matricula_Empre = 2 AND cod_Tel = 102;

DELETE FROM Empregados_Telefone
WHERE Matricula_Empre = 3 AND cod_Tel = 103;
);

CREATE TABLE IF NOT EXISTS Maquinas_Produtos(
    Cod_Maquina INT,
    Cod_Produtos_EMPR INT,
    PRIMARY KEY(Cod_Maquina, Cod_Produtos_EMPR),
    CONSTRAINT FK_Produtos_Maquinas FOREIGN KEY(Cod_Maquina)
    REFERENCES Maquinas(Cod_Maquina),
    CONSTRAINT FK_Maquinas_Produtos FOREIGN KEY(Cod_Produtos_EMPR)
    REFERENCES Produtos(Cod_Produtos)

INSERT INTO Maquinas_Produtos (Cod_Maquina, Cod_Produtos_EMPR)
VALUES (1, 101);

INSERT INTO Maquinas_Produtos (Cod_Maquina, Cod_Produtos_EMPR)
VALUES (2, 102);

INSERT INTO Maquinas_Produtos (Cod_Maquina, Cod_Produtos_EMPR)
VALUES (3, 103);

INSERT INTO Maquinas_Produtos (Cod_Maquina, Cod_Produtos_EMPR)
VALUES (4, 104);

INSERT INTO Maquinas_Produtos (Cod_Maquina, Cod_Produtos_EMPR)
VALUES (5, 105);

UPDATE Maquinas_Produtos
SET Cod_Produtos_EMPR = 106
WHERE Cod_Maquina = 1 AND Cod_Produtos_EMPR = 101;

UPDATE Maquinas_Produtos
SET Cod_Maquina = 6
WHERE Cod_Maquina = 2 AND Cod_Produtos_EMPR = 102;

DELETE FROM Maquinas_Produtos
WHERE Cod_Maquina = 3 AND Cod_Produtos_EMPR = 103;
);