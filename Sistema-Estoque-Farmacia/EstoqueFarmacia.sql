CREATE TABLE IF NOT EXISTS produtos(
	id SERIAL NOT NULL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	fabricante VARCHAR(30) NOT NULL,
	validade DATE NOT NULL,
	estoque_atual INT NOT NULL
)


CREATE TABLE IF NOT EXISTS movimentacoes(
	id SERIAL PRIMARY KEY NOT NULL,
	tipo VARCHAR(20) NOT NULL,
	data_hora DATE NOT NULL,
	responsavel VARCHAR(20) NOT NULL,
	observacao TEXT NOT NULL
)


CREATE TABLE IF NOT EXISTS movimentacoes_produtos(
	id SERIAL PRIMARY KEY NOT NULL,
	id_produtos INTEGER NOT NULL,
	id_movimentacoes INTEGER NOT NULL,
	quantidade INTEGER NOT NULL,
	FOREIGN KEY (id_produtos) REFERENCES produtos(id),
	FOREIGN KEY (id_movimentacoes) REFERENCES movimentacoes(id)
)