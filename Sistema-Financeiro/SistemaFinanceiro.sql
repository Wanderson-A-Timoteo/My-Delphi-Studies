CREATE TABLE IF NOT EXISTS 	usuarios(
	id CHARACTER(36) NOT NULL CONSTRAINT usuarios_pk PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	login VARCHAR(20) NOT NULL,
	senha VARCHAR(20) NOT NULL,
	status CHARACTER(1) NOT NULL,
	data_cadastro DATE NOT NULL
)


CREATE TABLE IF NOT EXISTS 	caixa(
	id CHARACTER(36) NOT NULL CONSTRAINT caixa_pk PRIMARY KEY,
	numero_doc VARCHAR(20) NOT NULL,
	descricao VARCHAR(200),
	valor DECIMAL(18,2) NOT NULL,
	tipo CHARACTER(1) NOT NULL,
	data_cadastro DATE NOT NULL
)


CREATE TABLE IF NOT EXISTS 	contas_pagar(
	id CHARACTER(36) NOT NULL CONSTRAINT contas_pagar_pk PRIMARY KEY,
	numero_documento VARCHAR(20) NOT NULL,
	descricao VARCHAR(200),
	parcela INTEGER NOT NULL,
	valor_parcela DECIMAL(18,2) NOT NULL,
	valor_compra DECIMAL(18,2) NOT NULL,
	valor_abatido DECIMAL(18,2) NOT NULL,
	data_compra DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	data_vencimento DATE NOT NULL,
	data_pagamento DATE,
	status CHARACTER(1) NOT NULL
)


CREATE TABLE IF NOT EXISTS 	contas_receber(
	id CHARACTER(36) NOT NULL CONSTRAINT contas_receber_pk PRIMARY KEY,
	numero_documento VARCHAR(20) NOT NULL,
	descricao VARCHAR(200),
	parcela INTEGER NOT NULL,
	valor_parcela DECIMAL(18,2) NOT NULL,
	valor_venda DECIMAL(18,2) NOT NULL,
	valor_abatido DECIMAL(18,2) NOT NULL,
	data_compra DATE NOT NULL,
	data_cadastro DATE NOT NULL,
	data_vencimento DATE NOT NULL,
	data_recebimento DATE,
	status CHARACTER(1) NOT NULL
)


CREATE TABLE IF NOT EXISTS 	contas_pagar_detalhes(
	id CHARACTER(36) NOT NULL CONSTRAINT contas_pagar_detalhes_pk PRIMARY KEY,
	id_conta_pagar CHARACTER(36) NOT NULL,
	detalhes VARCHAR(200),
	valor DECIMAL(18,2) NOT NULL,
	data DATE NOT NULL,
	usuario VARCHAR(50) NOT NULL
)


CREATE TABLE IF NOT EXISTS 	contas_receber_detalhes(
	id CHARACTER(36) NOT NULL CONSTRAINT contas_receber_detalhes_pk PRIMARY KEY,
	id_conta_pagar CHARACTER(36) NOT NULL,
	detalhes VARCHAR(200),
	valor DECIMAL(18,2) NOT NULL,
	data DATE NOT NULL,
	usuario VARCHAR(50) NOT NULL
)

