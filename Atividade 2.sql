CREATE DATABASE db_generation_game_online; 

USE db_generation_game_online; 

CREATE TABLE tb_classes(
id BIGINT AUTO_INCREMENT, 
nome VARCHAR(255) NOT NULL,
vida INT NOT NULL,
PRIMARY KEY (id) 
);

INSERT INTO tb_classes (nome, vida)
VALUES
("Frodo Bolseiro", "10"),
("Gandalf, o Cinzento", "5"),
("Aragorn, filho de Arathorn", "2"),
("Legolas Verdefolha", "3"),
("Gimli, filho de Glóin", "8");

CREATE TABLE tb_personagens(
classeid BIGINT, 
id BIGINT AUTO_INCREMENT, 
classe VARCHAR (20) NOT NULL, 
poder VARCHAR (15) NOT NULL,
tamanho DECIMAL (4,2), 
poder_ataque VARCHAR (255) NOT NULL, 
PRIMARY KEY (id),
FOREIGN KEY (classeid) REFERENCES tb_classes (nome)
);

INSERT INTO tb_personagens (classe, poder, tamanho, poder_ataque)
VALUES
("Guerreiro", "Força física e habilidades de combate", "Médio", 1000.00),
("Mago", "Magias poderosas e conhecimento arcano", "Médio", 1500.00),
("Ladrão", "Furtividade e habilidades de ladino", "Pequeno", 2500.00),
("Clérigo", "Magias divinas e cura", "Médio", 3000.00),
("Bárbaro", "Estrondo do trovão em seus golpes, causando estragos entre as fileiras inimigas", "Grande", 120),
("Druida", "Guardião das florestas com o poder das raízes antigas, capaz de se transformar em criaturas da natureza", "Médio", 92),
("Feiticeiro", "Invoca a energia da lua cheia para lançar poderosos encantamentos e maldições", "Médio", 88),
("Arqueiro", "Precisão com arco e flecha", "Médio", 80); 

SELECT * FROM tb_personagens WHERE poder_ataque > 2000; 
SELECT * FROM tb_personagens WHERE poder_ataque < 2000; 
SELECT * FROM tb_personagens WHERE nome LIKE "%c%";

SELECT nome, classeid, classe, poder, tamanho, poder_ataque, tb_classes.personagens
FROM tb_classes JOIN tb_personagens 
ON tb_classes.classeid = tb_personagens.classe;

SELECT nome, classeid, classe, poder, tamanho, poder_ataque, tb_classes.personagens
FROM tb_classes JOIN tb_personagens 
ON tb_classes.classeid = tb_personagens.classe
WHERE tb_personagens.classe = 'Arqueiro'; 
