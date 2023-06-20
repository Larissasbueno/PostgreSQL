
-- Crie a tabela tb_categorias e determine pelo menos 2 atributos, além da Chave Primária, relevantes para classificar as pizzas.
CREATE TABLE tb_categorias(
	id bigserial PRIMARY KEY,
	tipo_pizza varchar(50) not null,
	tamanho varchar (50) not null
);

-- Crie a tabela tb_pizzas e determine 4 atributos, além da Chave Primária, relevantes aos produtos da pizzaria.
CREATE TABLE tb_pizzas(
id bigserial PRIMARY KEY,
sabor varchar(255) not null,
ingredientes varchar(255) not null,
borda varchar(50) not null,
preco decimal(5,2) not null,
categoria_id bigint,
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insira 5 registros na tabela tb_categorias.
INSERT INTO tb_categorias (tipo_pizza, tamanho)
values ('salgada','Redonda 6 Pedaços');
INSERT INTO tb_categorias (tipo_pizza, tamanho)
values ('salgada', 'Redonda 8 Pedaços');
INSERT INTO tb_categorias (tipo_pizza, tamanho)
values ('salgada', 'Quadrada 6 Pedaços');
INSERT INTO tb_categorias (tipo_pizza, tamanho)
values ('salgada', 'Quadrada 8 Pedaços');
INSERT INTO tb_categorias (tipo_pizza, tamanho)
values ('Doce', 'Redonda 8 Pedaços');

select * from tb_categorias;

-- Insira 8 registros na tabela tb_pizzas, preenchendo a Chave Estrangeira para criar a relação com a tabela tb_categorias.
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Mussarela', 'molho de tomate, queijo mussarela, orégano, azeitonas', 'com borda', 45.00, 1);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Perperoni', 'molho de tomate, queijo mussarela, perperoni, orégano, azeitonas, cebola', 'sem borda', 57.00, 5);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Frango com Catupiry', 'molho de tomate, catupiry, orégano, frango desfiado, azeitonas', 'com borda', 67.00, 4);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Toscana', 'molho de tomate, queijo mussarela, orégano, azeitonas, calabresa', 'com borda', 55.00, 2);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Calabresa', 'molho de tomate, cebola, orégano, azeitonas, calabresa', 'sem borda', 45.00, 3);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Portuguesa', 'molho de tomate, queijo mussarela, orégano, azeitonas, milho, presunto, ervilha, ovo', 'sem borda', 50.00, 1);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Brigadeiro', 'morango, brigadeiro, m&ms', 'sem borda', 60.00, 5);
INSERT INTO tb_pizzas (sabor, ingredientes, borda, preco, categoria_id)
values ('Banana', 'leite condensado, banana', 'sem borda', 35.00, 5);

select * from tb_pizzas;

-- SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE preco > 45.00;

-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

--SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE sabor LIKE '%m%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT * from tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categoria_id;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, 
-- onde traga apenas as pizzas que pertençam a uma categoria específica
SELECT * from tb_pizzas
INNER JOIN tb_categorias ON tb_categorias.id = tb_pizzas.categoria_id WHERE tb_categorias.tipo_pizza = 'salgada';
