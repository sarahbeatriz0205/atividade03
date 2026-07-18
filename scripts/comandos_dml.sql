-- Comando B1.1. comando para inserir 5 registros na tabela Usuario (incluindo a usuária 'Sarah' exigida no SELECT C2).
INSERT INTO Usuario (usuario, nome, senha, data_nascimento, contato) VALUES
('Sarah', 'Sarah Mendes', 'senha123', '1995-05-12', 'sarah@email.com'),
('joao_silva', 'João Silva', 'crypto456', '1990-08-24', 'joao@email.com'),
('maria_oliveira', 'Maria Oliveira', 'p@ssword', '1988-11-03', 'maria@email.com'),
('carlos_adm', 'Carlos Rocha', 'admin789', '2000-01-15', 'carlos@email.com'),
('ana_julia', 'Ana Júlia', 'anaj123', '1997-03-30', 'ana@email.com');

-- Comando B1.2. comando para inserir 5 registros na tabela Perfil vinculados aos usuários criados.
INSERT INTO Perfil (usuario, bio, genero, avatar, sugestoes) VALUES
('Sarah', 'Desenvolvedora e fotógrafa nas horas vagas.', 'Feminino', 'avatar_sarah.png', TRUE),
('joao_silva', 'Entusiasta de tecnologia e banco de dados.', 'Masculino', 'avatar_joao.png', FALSE),
('maria_oliveira', 'Viajante pelo mundo.', 'Feminino', 'avatar_maria.png', TRUE),
('carlos_adm', 'Perfil oficial de suporte técnico.', 'Masculino', 'avatar_carlos.png', FALSE),
('ana_julia', 'Estudante de Design Gráfico.', 'Feminino', 'avatar_ana.png', TRUE);

-- Comando B1.3. comando para inserir 5 registros na tabela Endereco.
INSERT INTO Endereco (estado, cidade, bairro, pais) VALUES
('SP', 'São Paulo', 'Centro', 'Brasil'),
('RJ', 'Rio de Janeiro', 'Copacabana', 'Brasil'),
('MG', 'Belo Horizonte', 'Savassi', 'Brasil'),
('RS', 'Porto Alegre', 'Moinhos de Vento', 'Brasil'),
('PR', 'Curitiba', 'Bathel', 'Brasil');

-- Comando B1.4. comando para inserir 5 registros na tabela Publicacao (garantindo o id_publicacao 1 e postagens da 'Sarah').
INSERT INTO Publicacao (id_publicacao, descricao, data_publicacao, usuario, id_endereco) VALUES
(1, 'Minha primeira publicação na plataforma!', '2026-01-05', 'Sarah', 1),
(2, 'Olhem essa foto linda que tirei ontem.', '2026-01-10', 'Sarah', 2),
(3, 'Dica do dia: usem chaves estrangeiras com CASCADE.', '2026-02-15', 'joao_silva', 3),
(4, 'Nova atualização do sistema disponível na segunda.', '2026-03-01', 'carlos_adm', 1),
(5, 'Alguém recomenda um bom livro de SQL?', '2026-03-12', 'ana_julia', 5);

-- Comando B1.5. comando para inserir 5 registros na tabela Mensagem.
INSERT INTO Mensagem (destinatario, remetente, texto, data_mensagem) VALUES
('joao_silva', 'Sarah', 'Oi João, tudo bem com o projeto?', '2026-01-06'),
('Sarah', 'joao_silva', 'Tudo ótimo, Sarah! Consegui ajustar as PKs.', '2026-01-06'),
('maria_oliveira', 'ana_julia', 'Parabéns pelo seu aniversário!', '2026-03-30'),
('carlos_adm', 'joao_silva', 'Estou com dúvidas sobre o acesso ao banco.', '2026-03-02'),
('joao_silva', 'carlos_adm', 'Respondido no seu e-mail de suporte.', '2026-03-02');

-- Comando B1.6. comando para inserir 5 registros na tabela Colabora.
INSERT INTO Colabora (id_publicacao, usuario) VALUES
(1, 'joao_silva'),
(1, 'maria_oliveira'),
(3, 'carlos_adm'),
(4, 'joao_silva'),
(5, 'Sarah');

-- Comando B1.7. comando para inserir 5 registros na tabela Curte.
INSERT INTO Curte (id_publicacao, usuario) VALUES
(1, 'joao_silva'),
(1, 'maria_oliveira'),
(2, 'ana_julia'),
(3, 'Sarah'),
(4, 'ana_julia');

-- Comando B1.8. comando para inserir 5 registros na tabela Perfil_Link.
INSERT INTO Perfil_Link (link, usuario) VALUES
('://github.com', 'Sarah'),
('://linkedin.com', 'joao_silva'),
('://instagram.com', 'maria_oliveira'),
('://plataforma.com', 'carlos_adm'),
('behance.net/anajulia', 'ana_julia');

-- Comando B1.9. comando para inserir 5 registros na tabela Publicacao_Fotos.
INSERT INTO Publicacao_Fotos (fotos_publicacao, id_publicacao) VALUES
('foto_teste_1.jpg', 1),
('paisagem_copacabana.jpg', 2),
('codigo_sql.png', 3),
('banner_update.png', 4),
('livros_recomendados.jpg', 5);

-- Comando B1.10. comando para inserir 5 registros na tabela Publicacao_Videos.
INSERT INTO Publicacao_Videos (videos_publicacao, id_publicacao) VALUES
('video_introducao.mp4', 1),
('vlog_rio.mp4', 2),
('tutorial_banco.mp4', 3),
('demonstracao_sistema.mp4', 4),
('review_livro.mp4', 5);

-- Comando B1.11. comando para inserir 5 registros na tabela Comentario (incluindo dados na publicação 1 com datas posteriores a 01/01/2026 exigidos no SELECT C3).
INSERT INTO Comentario (id_publicacao, usuario, texto, data_comentario) VALUES
(1, 'joao_silva', 'Excelente post, me ajudou bastante!', '2026-01-05'),
(1, 'maria_oliveira', 'Que iniciativa legal!', '2026-01-06'),
(2, 'ana_julia', 'Essa foto ficou espetacular!', '2026-01-11'),
(3, 'carlos_adm', 'Dica de ouro para sysadmins.', '2026-02-16'),
(5, 'Sarah', 'Recomendo o livro Learning SQL da O Reilly.', '2026-03-13');

-- Comando B2. comando para atualizar um campo de todos os registros de uma tabela (Altera todos os países no Endereco para 'Brasil Capitalista').
UPDATE Endereco 
SET pais = 'Brasil';

-- Comando B3. comando para atualizar um campo dos registros que satisfazem uma condição simples (Muda o gênero do usuário 'joao_silva').
UPDATE Perfil 
SET genero = 'Masculino/Não Informado' 
WHERE usuario = 'joao_silva';

-- Comando B4. comando para atualizar um campo dos registros que satisfazem uma condição composta (Modifica o texto de um comentário específico usando ID da publicação E autor).
UPDATE Comentario 
SET texto = 'Comentário moderado por infringir as diretrizes da comunidade.' 
WHERE id_publicacao = 4 AND usuario = 'ana_julia';

-- Comando B5. comando para atualizar dois campos dos registros que satisfazem uma condição (Atualiza a descrição e a data de uma publicação específica da Sarah).
UPDATE Publicacao 
SET descricao = 'Publicação revisada e atualizada pelo autor.', data_publicacao = '2026-07-15' 
WHERE id_publicacao = 2;

-- Comando B6. comando para atualizar um campo usando o antigo valor desse campo (Concatena um texto de aviso ao final da biografia atual do perfil do carlos_adm).
UPDATE Perfil 
SET bio = bio || ' (Conta de suporte oficial)' 
WHERE usuario = 'carlos_adm';

-- Comando B7. comando para atualizar um campo usando uma função (Converte o nome do usuário para letras MAIÚSCULAS usando a função UPPER).
UPDATE Usuario 
SET nome = UPPER(nome) 
WHERE usuario = 'ana_julia';

-- Comando B8. comando para remover todos os registros de uma tabela (Remove todos os registros da tabela Curte, limpando as curtidas).
DELETE FROM Curte;

-- Comando B9. comando para remover os registros que satisfazem uma condição simples (Exclui os vídeos vinculados especificamente à publicação de número 5).
DELETE FROM Publicacao_Videos 
WHERE id_publicacao = 5;

-- Comando B10. comando para remover os registros que satisfazem uma condição composta (Exclui mensagens específicas que foram enviadas de um usuário para outro em uma data anterior a determinada marca).
DELETE FROM Mensagem 
WHERE remetente = 'joao_silva' AND destinatario = 'Sarah' AND data_mensagem < '2026-02-01';

-- Comando B11. comando para remover registros avaliando um campo por meio de uma função (Remove links de perfil cujo tamanho do endereço web seja menor que 15 caracteres utilizando a função LENGTH).
DELETE FROM Perfil_Link 
WHERE LENGTH(link) < 15;