-- --------  Trabalho Final  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 30/08/2022
-- Autor(es) ..............: Nicolas Chagas Souza, Mateus Vinicius Ferreira Franco e Thiago Franca Vale Oliveira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF3_NicolasSouza
--
-- Ultimas Alteracoes
--   30/08/2022 => Criacao do script
--
-- PROJETO => 01 Base de Dados
--         => 17 Tabelas
--
-- ---------------------------------------------------------

-- BASE DE DADOS
create database if not exists TF3_NicolasSouza;

use TF3_NicolasSouza;

-- TABELAS
create table PESSOA (
    cpf 			bigint				not null,
    nome 			varchar(100)	not null,
    dtNascimento 	date			not null,
    telefone 		bigint			not null,
    email 			varchar(100) 	not null,
    cep 			bigint			not null,
    rua 			varchar(100)	not null,
    bairro 			varchar(100)	not null,
    numero			int				not null,
    cidade 			varchar(100)	not null,
    siglaEstado 	varchar(2)		not null,
    tipo 			enum('F','C')	not null,
    constraint pessoa_pk primary key(cpf),
    constraint pessoa_email_uk unique key (email)
);

create table FUNCIONARIO (
    dtContratacao 	date			not null,
    salario 		float			not null,
    cargo 			enum('G', 'M')	not null,
    cpf 			bigint 			not null,
    constraint funcionario_pessoa_fk foreign key(cpf) 
		references PESSOA(cpf) on delete cascade
);

create table CLUBE (
    idClube 			int 	not null 	auto_increment,
    limiteJogos 		int 	not null,
    preco 				float	not null,
    constraint clube_pk primary key(idClube)    
) engine = InnoDB auto_increment = 1;

create table MEMBRO (
    cpf 				bigint 			not null,
    numeroCartao 		bigint 			not null,
    dtValidadeCartao 	date 			not null,
    cvcCartao 			int 			not null,
    titularCartao 		varchar(100) 	not null,
    idClube 			int 			not null,
    constraint membro_pessoa_fk 		foreign key(cpf)
		references PESSOA(cpf) on delete cascade,
	constraint membro_clube_fk 			foreign key (idClube)
		references CLUBE(idClube) on delete cascade
);

create table CATEGORIA (
    idCategoria 	int 			not null auto_increment,
    cor 			varchar(15) 	not null,
    descricao 		varchar(100) 	not null,
    constraint categoria_pk 		primary key(idCategoria),
    constraint categoria_cor_uk 	unique key(cor)
) engine = InnoDB auto_increment = 1;
 
create table ARTIGO (
    copia 		int				not null,
    nome 		varchar(100)	not null,
    tipo 		enum('J', 'Q') 	not null,
    alugado 	bool			not null,
    danificado 	bool			not null,
    idCategoria int				not null,
    constraint artigo_pk 			primary key (copia, nome),
    constraint artigo_categoria_fk 	foreign key (idCategoria) 
		references CATEGORIA(idCategoria) on delete cascade
);

create table MESA (
	idMesa 		int  	not null auto_increment,
    constraint mesa_pk primary key (idMesa)
) engine = InnoDB auto_increment = 1;

create table JOGADOR (
    apelido 	varchar(100) 	not null,
    idMesa 		int				not null,
    constraint jogador_pk 		primary key(apelido),
    constraint jogador_mesa_fk 	foreign key(idMesa) 
		references MESA(idMesa) on delete cascade
);

create table COMANDA (
    idComanda 	int		not null 	auto_increment,
    idMesa 		int		not null,
    idGarcom 	bigint	not null,
    constraint comanda_pk 			primary key(idComanda),
    constraint comanda_mesa_fk 		foreign key (idMesa)
		references MESA(idMesa),
	constraint comanda_garcom_fk 	foreign key(idGarcom)
		references FUNCIONARIO(cpf)
) engine = InnoDB auto_increment = 1;

create table LANCHE (
    codLanche 	int 			not null auto_increment,
    nome 		varchar(100) 	not null,
    preco 		float			not null,
    constraint lanche_pk 		primary key(codLanche),
    constraint lanche_nome_uk 	unique key(nome)
) engine = InnoDB auto_increment = 1;

 create table PRODUTO (
    codProduto 	int 			not null 	auto_increment,
    nome 		varchar(100) 	not null,
    valor 		float			not null,
    constraint produto_pk 		primary key(codProduto),
    constraint produto_nome_uk 	unique key(nome)
) engine = InnoDB auto_increment = 1;

create table CONTA (
    idConta 		int								not null 	auto_increment,
    dataPagamento 	date							not null,
    formaPagamento 	enum('DEB','CRE','PIX','DIN') 	not null,
    idComanda 		int,
    constraint conta_pk primary key(idConta),
    constraint conta_comanda_fk foreign key(idComanda)
		references COMANDA(idComanda) on delete cascade
) engine = InnoDB auto_increment = 1;

create table PARTIDA (
    idPartida 		int				not null 	auto_increment,
    dtPartida 		date 			not null,
    copiaArtigo 	int				not null,
    nomeArtigo 		varchar(100) 	not null,
    idMonitor 		bigint,
    constraint partida_pk 		primary key (idPartida),
    constraint partida_artigo_fk foreign key (copiaArtigo, nomeArtigo) 
		references ARTIGO(copia, nome) on delete cascade,
	constraint partida_monitor_fk foreign key(idMonitor)
		references FUNCIONARIO(cpf) on delete set null
        
) engine = InnoDB auto_increment = 1; 

create table ALUGUEL (
    codAluguel 		int				not null 	auto_increment,
    dtAluguel 		date			not null,
    valor 			float			not null,
    contratoPath 	varchar(100) 	not null,
    idCliente 		bigint				not null,
    constraint aluguel_pk primary key(codAluguel),
    constraint aluguel_cliente_fk foreign key(idCliente)
		references MEMBRO(cpf) on delete cascade,
	constraint aluguel_contratoPath_uk unique key(contratoPath)
        
) engine = InnoDB auto_increment = 1; 

create table inclui (
    codAluguel 		int				not null,
    copiaArtigo 	int				not null,
    nomeArtigo 		varchar(100)	not null,
    constraint inclui_aluguel_fk 	foreign key (codAluguel)
		references ALUGUEL (codAluguel),
	constraint inclui_artigo_fk foreign key (copiaArtigo, nomeArtigo) 
		references ARTIGO(copia, nome)
);

create table possui (
    idConta 		int		not null,
    codProduto 		int		not null,
    constraint possui_conta_fk foreign key(idConta) 
		references CONTA(idConta) on delete cascade,
	constraint possui_produto_fk foreign key(codProduto)
		references PRODUTO(codProduto) on delete cascade
);

create table contem(
	codLanche	int 	not null, 
    idComanda	int 	not null, 
    constraint contem_lanche_fk foreign key(codLanche)
		references LANCHE(codLanche) on delete cascade,
	constraint contem_comanda_fk foreign key(idComanda)
		references COMANDA(idComanda) on delete cascade    
);
