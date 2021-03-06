
#Criando a tabela 'Livros'

CREATE TABLE LIVROS (
    ID_LIVRO INT NOT NULL,
    NOME_LIVRO VARCHAR(100) NOT NULL,
    AUTORIA VARCHAR(100) NOT NULL,
    EDITORA VARCHAR(100) NOT NULL,
    CATEGORIA VARCHAR(100) NOT NULL,
    PREÇO DECIMAL(5,2) NOT NULL,  
    PRIMARY KEY (ID_LIVRO)
);

CREATE TABLE ESTOQUE (
    ID_LIVRO INT NOT NULL,
	QTD_ESTOQUE INT NOT NULL,
    PRIMARY KEY (ID_LIVRO)
);

# Criação das outras tabelas
CREATE TABLE VENDAS (
    ID_PEDIDO INT NOT NULL,
    ID_VENDEDOR INT NOT NULL,
    ID_LIVRO INT NOT NULL,
    QTD_VENDIDA INT NOT NULL,
    DATA_VENDA DATE NOT NULL,
    PRIMARY KEY (ID_VENDEDOR,ID_PEDIDO)
);

CREATE TABLE VENDEDORES (
ID_VENDEDOR INT NOT NULL,
NOME_VENDEDOR VARCHAR(255) NOT NULL,
PRIMARY KEY (ID_VENDEDOR)
);




# Relação entre 'Livros' e 'Estoque'.
/* Alterando a tabela Estoque (tabela filha) adicionando 
   a restrição de chave estrageira chamada CE_LIVROS_ESTOQUES 
   que referencia à tabela livros (tabela pai) 
   vinculando as colunas (ID_LIVRO de ambas as tabelas */
   
ALTER TABLE ESTOQUE ADD CONSTRAINT CE_LIVROS_ESTOQUES
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


# Relação entre Vendores e Vendas
ALTER TABLE VENDEDORES ADD CONSTRAINT CE_VENDEDORES_VENDAS
FOREIGN KEY (ID_VENDEDOR)
REFERENCES VENDAS (ID_VENDEDOR)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


# Relação entre Vendas e Livros
ALTER TABLE VENDAS ADD CONSTRAINT CE_VENDAS_LIVROS
FOREIGN KEY (ID_LIVRO)
REFERENCES LIVROS (ID_LIVRO)
ON DELETE NO ACTION
ON UPDATE NO ACTION;


##########            Códigos Extras               ##########

# Para identificar todos as restrições cadastradas
USE INFORMATION_SCHEMA;
SELECT * FROM REFERENTIAL_CONSTRAINTS WHERE CONSTRAINT_SCHEMA ='clube_do_livro';


# Excluir chave estrangeira
USE CLUBE_DO_LIVRO;
ALTER TABLE VENDEDORES DROP FOREIGN KEY FK_VENDEDORES_VENDAS;

USE CLUBE_DO_LIVRO;
ALTER TABLE ESTOQUE DROP FOREIGN KEY CE_ESTOQUE_LIVRO;


