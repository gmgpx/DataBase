SELECT * FROM livros_autor

--a
SELECT livros.titulo,autor.nome FROM livros NATURAL INNER JOIN autor

--b
SELECT livros.titulo,autor.nome FROM livros FULL JOIN autor
ON livros.isbn = autor.id_autor WHERE nome='De Assis, Machado' 

INSERT INTO livros_autor (isbn, id_autor) 
VALUES (6, 8),
       (7, 7),
       (8, 6);
