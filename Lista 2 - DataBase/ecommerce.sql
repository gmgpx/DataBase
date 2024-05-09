SELECT * FROM products

INSERT INTO products (productname,brand,category,discount,price) VALUES
('impressora','hp','eletronicos',0.12,489.9),
('luminaria','ge','eletronicos',0.5,46.80),
('drone','dji','eletronico',0.12,9856.0);

--Cross Join
--SELECT * FROM clients,products
--SELECT * FROM clients CROSS JOIN products


-- Inner Join (Relaciona por PK/FK)
SELECT * FROM clients INNER JOIN products
ON clients.idclient = products.idclient

SELECT * FROM clients INNER JOIN products USING (idclient)

-- Naturalmente utiliza a PK e a FK como comparadores
SELECT * FROM clients NATURAL INNER JOIN products


-- Inner Join (Relaciona por pk/fk) mostrando apenas colunas especificas
SELECT firstname,productname FROM clients INNER JOIN products
ON clients.idclient = products.idclient

-- Inner Join (Relaciona por pk/fk) mostrando apenas colunas de Rodrigo
SELECT firstname,productname FROM clients INNER JOIN products
ON clients.idclient = products.idclient WHERE firstname='Rodrigo' OR firstname='rodrigo'