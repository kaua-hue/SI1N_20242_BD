CREATE TABLE login_colaborador(
    senha_login_colaborador int primary key,
    nome_usuário_login_colaborador varchar(100) not null,
    foreign key (id_colaborador) references colaborador (id_colaborador)
);

CREATE TABLE login_donatário(
    senha_login_donatário int primary key,
   nome_usuário_login_donatário varchar(100) not null,
   foreign key (id_donatário) references donatário (id_donatário)
);

CREATE TABLE colaborador (
    id_colaborador int primary key,
    nome_colaborador varchar (100) not null,
    email_colaborador varchar(100) unique,
    telefone_colaborador varchar(13),
    foreign key (senha_login_colaborador) references login_colaborador (senha_login_colaborador)
    foreign key (cod_minha_conta) references cod_minha_conta (cod_minha_conta)
);

    CREATE TABLE donatário (
    id_donatário INT AUTO_INCREMENT PRIMARY KEY,
    nome_donatário VARCHAR(100) NOT NULL,
    email_donatário VARCHAR(100) UNIQUE,
    telefone_donatário VARCHAR(13),
    nessecidade_donatário VARCHAR(300),
    foreign key (senha_login_donatário) references login_donatário (senha_login_donatário)
    foreign key (id_cadastro_donatário) references id_cadastro_donatário (id_cadastro_donatário)
    foreign key (cod_minha_conta) references cod_minha_conta (cod_minha_conta)
);

CREATE TABLE cadastro_donatário (
    id_cadastro_donatário int primary key,
    nome_responsável_geral_cadastro_donatário varchar(100) not null,
    nome_instituição_cadastro_donatário varchar(100),
    setor_cadastro_donatário ENU('RH', 'financeiro', 'TI', 'outro'),
    email_cadastro_donatário varchar(100) unique,
    senha_cadastro_donatário varchar(30) not null,
    foreign key (id_donatário) references donatário (id_donatário)
);

CREATE TABLE minha_conta (
    cod_minha_conta varchar(50) primary key,
    nome_usuário varchar(100) not null,
    email_cadastrado varchar(100) unique,
    telefone varchar(13),
    papel_na_plataforma ENUM('colaborador', 'donatário', 'outro'),
    foreign key (id_colaborador) references colaborador (id_colaborador)
    foreign key (id_donatário) references donatário (id_donatário)
);

CREATE TABLE Editais (
    setor_edital INT PRIMARY KEY,   
    titulo_edital VARCHAR(255) NOT NULL,             
    descrição_edital TEXT,                         
    data_publicação_edital DATE NOT NULL,             
    data_encerramento_edital DATE,         
    tipo_edital ENUM('Licitação', 'Concurso', 'Outros'), 
    status_edital ENUM('Aberto', 'Encerrado', 'Cancelado')
);

CREATE TABLE equipes_fortificar (
    id_equipe INT AUTO_INCREMENT PRIMARY KEY,
    nome_equipe VARCHAR(100) NOT NULL, 
    descrição_equipe TEXT,           
    data_criação_equipe DATE NOT NULL,         
    status_equipe ENUM('Ativa', 'Inativa'),
    lider_equipe VARCHAR(100), 
    nome_integrantes_equipe varchar(400), 
    número_membros INT DEFAULT 0   
);

CREATE TABLE projetos(
    id_projetos int primary key,
    setor_projetos varchar (300),
    nome_projeto varchar(100) not null,
    data_inicio_projeto date not null,
    data_fim_projeto date,
    responsavel_projeto varchar(200),
    descrição_projeto text,
    orçamento_projeto decimal(15,2),
    tipo_projeto ENUM('financeiro', 'TI', 'outro')
    foreign key (id_meus_projetos) references id_meus_projetos (id_meus_projetos)
);

CREATE TABLE meus_projetos(
    id_meus_projetos INT AUTO_INCREMENT PRIMARY KEY, 
    titulo_meus_projetos VARCHAR(200) NOT NULL,    
    descrição_meus_projetos TEXT,        
    data_inicio_meus_projetos DATE NOT NULL,      
    data_fim_meus_projetos DATE,                   
    status_meus_projetos ENUM('Planejado', 'Em andamento', 'Concluído', 'Cancelado'), 
    categoria_meus_projetos VARCHAR(100),
    foreign key (id_projetos) references projetos (id_projetos)  
);

CREATE TABLE contato_fortes ( 
    id_contato int primary key,
    nome_contato varchar(100),
    telefone_contato varchar(13),
    email_contato varchar(100),
    mensagem_contato varchar(500)
);
    



