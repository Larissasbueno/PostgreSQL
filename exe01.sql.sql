-- PostgreSQL
-- criando tabela, com chave primaria (primary key)
CREATE TABLE tb_classes(
	id bigserial PRIMARY KEY,
	nome_classes varchar(50),
	habilidades varchar (50)
);
   
   
-- criando tabela, com chave primaria (primary key) com 4 atributos
CREATE TABLE tb_personagens(
id bigserial PRIMARY KEY,
nome varchar(255) not null,
nivel INT not null,
poder_ataque int,
poder_defesa int,
classe_id bigint,
FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);


-- inserindo Registros a tabela tb_classe
INSERT INTO tb_classes (nome_classes, habilidades)
values ('Bruxo', 'soluçar');
INSERT INTO tb_classes (nome_classes, habilidades)
values ('Magos', 'pular');
INSERT INTO tb_classes (nome_classes, habilidades)
values ('Fadas', 'correr');
INSERT INTO tb_classes (nome_classes, habilidades)
values ('Arqueiros', 'cantar');
INSERT INTO tb_classes (nome_classes, habilidades)
values ('Doendes', 'dormir');

select * from tb_classes;

-- inserindo Registros a tabela tb_personagens
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Sabrina', 100, 5000, 2000, 3);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Benicio', 200, 1000, 5000, 5);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Lorena', 10, 500, 3000, 2);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Porfilia', 150, 2200, 3500, 1);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Pietro', 900, 9500, 8000, 2);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Larissa', 90, 200, 200, 4);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Pet', 50, 3300, 2200, 4);
INSERT INTO tb_personagens (nome, nivel, poder_ataque, poder_defesa, classe_id)
values ('Tais', 150, 4000, 4000, 5);


select * from tb_personagens;

-- SELECT retornando todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

--  SELECT retornando todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE '%c%';

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT * from tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id;

-- SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
-- onde traga apenas os personagens que pertençam a uma classe específica
SELECT * from tb_personagens
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classe_id WHERE tb_classes.nome_classes = 'Arqueiros';



