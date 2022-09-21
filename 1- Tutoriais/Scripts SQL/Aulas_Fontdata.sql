-- PRIMEIRA PARTE

-- Criar Database
CREATE DATABASE "Aulas_Fontdata"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'pt_BR.UTF-8'
    LC_CTYPE = 'pt_BR.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


-- Excluir tabelas 
drop table IF EXISTS movimento;
drop table IF EXISTS produtos;
drop table IF EXISTS clientes;
drop table IF EXISTS tmp;

CREATE schema

-- Criar tabelas
CREATE TABLE IF NOT EXISTS public.produtos
(
	codigo serial NOT NULL,
	descricao character(30) NOT NULL,
    CONSTRAINT "pk_produto" PRIMARY KEY (codigo)
);

	
CREATE TABLE IF NOT EXISTS public.movimento
(
	numero integer NOT NULL,
    cod_produto integer NOT NULL,
	data_atual date NOT NULL DEFAULT DATE(NOW()),
	valor numeric(15,2) NOT NULL default 0,
    CONSTRAINT "pk_movimento" PRIMARY KEY (numero),
    CONSTRAINT fk_produtos FOREIGN KEY (cod_produto)
        REFERENCES public.produtos (codigo) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION	
);


CREATE TABLE IF NOT EXISTS public.tmp
(
	codigo serial NOT NULL,
	descricao character(30) NOT NULL
);


-- Adicionar campos nas tabelas
ALTER TABLE IF EXISTS public.tmp
    ADD CONSTRAINT pk_tmp PRIMARY KEY (codigo);

ALTER TABLE IF EXISTS public.produtos
    ADD COLUMN unidade character(2);
	
	

-- Inserção de valores nos campos da tabela	
INSERT INTO produtos (descricao,unidade)
VALUES ('PRODUTO A','CX'),('PRODUTO B','LT'),('PRODUTO C','UN');

INSERT INTO movimento (numero,cod_produto,data_atual,valor)
VALUES (1,1,'2022/03/01',100), (2,1,'2022/03/05',200), (3,2,'2022/03/15',300), (4,3,'2022/03/12',400), (5,3,'2022/03/22',300);


-- Deletar os valores de uma tabela
DELETE FROM produtos WHERE codigo = 2


-------------------------------------------************************************************************************---------------------------------------------

-- SEGUNDA PARTE

-- Criar tabelas
CREATE TABLE IF NOT EXISTS public.clientes
(
	codigo serial NOT NULL,
	nome character(30),
    CONSTRAINT "pk_cliente" PRIMARY KEY (codigo)
);


-- Adicionar campos na tabela
ALTER TABLE public.clientes
   ALTER COLUMN nome SET NOT NULL;

ALTER TABLE IF EXISTS public.movimento
    ADD COLUMN cod_cliente integer;

ALTER TABLE IF EXISTS public.movimento
    ADD CONSTRAINT fk_clientes FOREIGN KEY (cod_cliente)
    REFERENCES public.clientes (codigo) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;	
		

--------------------------------------------------------------***************************************************----------------------------------------
-- TERCEIRA PARTE


-- INSERT - Inserir Registros em uma tabela

-- INSERT <nome tabela> (<campo1>,<campo2)
-- VALUES (XXXXX,XXX)

select * from produtos

insert into produtos (descricao,unidade)
values ('PRODUTO H','KG')
RETURNING codigo; 

CREATE TABLE IF NOT EXISTS public.produtos2
(
    codigo integer NOT NULL DEFAULT nextval('produtos_codigo_seq'::regclass),
    descricao character(30) COLLATE pg_catalog."default" NOT NULL,
    unidade character(2) COLLATE pg_catalog."default",
    CONSTRAINT pk_produto2 PRIMARY KEY (codigo)
);


insert into produtos2 (select * from produtos);

CREATE TABLE IF NOT EXISTS public.produtos3
(
    codigo integer NOT NULL DEFAULT nextval('produtos_codigo_seq'::regclass),
    descricao character(30) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT pk_produto3 PRIMARY KEY (codigo)
);

insert into produtos3 (select codigo,descricao from produtos);




-- UPDATE - Modificar Registros de uma tabela

-- UPDATE  <nome tabela> SET <campo1>=<conteudo1>,
--                           <campo2>=<conteudo2>
-- WHERE <campowhere> = <conteudowhere>

select * from produtos2 order by codigo;

UPDATE produtos2 SET unidade = 'KG'
WHERE codigo = 5;

select codigo,descricao,unidade,'XX' as nova
from produtos2
WHERE unidade =  'KG';

UPDATE produtos2 SET UNIDADE = 'XX'
WHERE unidade =  'KG';

select numero,cod_produto,valor,(valor+50) as novo
FROM movimento
WHERE cod_produto = 1;

select * from clientes;

insert into clientes (nome) values ('JOSE'),('ANTONIO');

update movimento set valor = (valor+50), cod_cliente = 1
WHERE cod_produto = 1;

select * from movimento;

select numero,cod_produto,cod_cliente,2 as novo
FROM movimento 
where cod_cliente is null;

update movimento set cod_cliente = 2
where cod_cliente is null;



-- DELETE - Eliminar ou Apagar Registros de uma tabela

-- DELETE FROM <nome tabela>
-- WHERE <campowhere> = <conteudowhere>

select * from produtos2

SELECT * FROM produtos2 p
WHERE p.unidade = 'XX';

DELETE FROM produtos2 p
WHERE p.unidade = 'XX';

DELETE FROM produtos2 p
WHERE p.unidade = 'CX' and p.codigo < 5;

------------------------------------*********************************************************-------------------------------------------

--set search_path = public,fontdata

-- select <schema>.<tabela>.<campo1>,
--        <schema>.<tabela>.<campo2>
-- from <schema>.<tabela>
-- where <schema>.<tabela>.<campox> = <comparacao>
-- order by <schame>.<tabela>.<campox>

-- max() - Maior
-- min() = Minimo
-- avg() = Media
-- sum() = soma
-- count() = conta


select nome as cidade,
       (select round(avg(temperatura),0) 
		from  public.temperaturas t 
		where t.cod_cidade = c.codigo) as temp
from public.cidades c


-- select min(temperatura)
-- from temperaturas
-- where cod_cidade = 1









