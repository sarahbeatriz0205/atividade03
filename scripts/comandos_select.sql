-- Comando C1.
-- Listar todos os usuários cadastrados na plataforma.
SELECT *
FROM Usuario;

-- Comando C2.
-- Listar as publicações realizadas por um usuário específico.
SELECT
    id_publicacao,   
    descricao,
    data_publicacao  
FROM Publicacao
WHERE usuario = 'Sarah';

-- Comando C3.
-- Listar os comentarios de uma publicação com data maior ou igual a 01/01/2026
SELECT
    *
FROM Comentario
WHERE 
    id_publicacao = 1 
    AND data_comentario >= '2026-01-01'; 

-- Comando C4.
-- Exibir a quantidade de publicações realizadas por cada usuário.
SELECT
    usuario,
    COUNT(*) AS quantidade_publicacoes
FROM Publicacao
GROUP BY usuario
HAVING COUNT(*) >= 1;

-- Comando C5.
-- Listar os usuários que já realizaram pelo menos uma publicação.
SELECT
    usuario,
    nome
FROM Usuario
WHERE usuario IN (
    SELECT usuario
    FROM Publicacao
);