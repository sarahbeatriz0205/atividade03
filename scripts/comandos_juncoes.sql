-- Comando D1.
-- Exibir as publicações juntamente com o nome do usuário que as realizou.
SELECT
    U.nome,
    P.descricao,
    P.data_publicacao -- CORRIGIDO: nome real da coluna
FROM
    Usuario AS U
    INNER JOIN Publicacao AS P ON (U.usuario = P.usuario);

-- Comando D2.
-- Exibir os comentários, o usuário que comentou e a publicação correspondente.
SELECT
    U.nome,
    P.descricao,
    C.texto,
    C.data_comentario -- CORRIGIDO: nome real da coluna
FROM 
    Usuario AS U
    INNER JOIN Comentario AS C ON (U.usuario = C.usuario)
    INNER JOIN Publicacao AS P ON (C.id_publicacao = P.id_publicacao); -- CORRIGIDO: nomes reais das colunas

-- Comando D3.
-- Listar todos os usuários, incluindo aqueles que ainda não possuem perfil cadastrado.
SELECT
    U.usuario,
    U.nome,
    P.bio,
    P.avatar
FROM 
    Usuario AS U
    LEFT OUTER JOIN Perfil AS P ON (U.usuario = P.usuario);

-- Comando D4.
-- Exibir todos os usuários e seus perfis, incluindo registros sem correspondência entre as tabelas.
SELECT
    U.usuario,
    U.nome,
    P.bio,
    P.genero
FROM 
    Usuario AS U
    FULL OUTER JOIN Perfil AS P ON (U.usuario = P.usuario);