SELECT * FROM func_proj

INSERT INTO func_proj (id_func, id_proj)
VALUES(7, 1);


SELECT * FROM (projetos NATURAL INNER JOIN func_proj) INNER JOIN funcionarios USING (id_func)

SELECT * FROM (projetos NATURAL INNER JOIN func_proj) INNER JOIN funcionarios USING (id_func)
WHERE id_proj = '3'

-- a
SELECT funcionarios.nome_func, projetos.nome_proj FROM (projetos NATURAL INNER JOIN func_proj) INNER JOIN funcionarios USING (id_func)
WHERE id_proj = '3'

-- b
SELECT * FROM (projetos NATURAL INNER JOIN func_proj) INNER JOIN funcionarios USING (id_func)
WHERE id_func = '7'

--c
SELECT AVG(num_funcionarios) AS media_funcionarios_por_projeto
FROM (
    SELECT COUNT(DISTINCT id_func) AS num_funcionarios
    FROM func_proj
    GROUP BY id_proj
) AS subquery;






