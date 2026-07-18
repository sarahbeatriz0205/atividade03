-- Comando A1. comando para criar a tabela Usuario, que armazena os dados cadastrais básicos das contas do sistema.
CREATE TABLE Usuario (
    usuario VARCHAR(50) PRIMARY KEY,
    nome VARCHAR(64) NOT NULL,
    senha VARCHAR(255) NOT NULL,
    data_nascimento DATE, 
    contato VARCHAR(255)
);

-- Comando A2. comando para criar a tabela Perfil, estabelecendo uma relação 1 para 1 com a tabela Usuario para guardar configurações adicionais de conta com exclusão em cascata.
CREATE TABLE Perfil (
    usuario VARCHAR(50) PRIMARY KEY,
    bio VARCHAR(150),
    genero VARCHAR(50),
    avatar VARCHAR(255),
    sugestoes BOOLEAN, 
    FOREIGN KEY (usuario) REFERENCES Usuario(usuario) ON DELETE CASCADE
);

-- Comando A3. comando para criar a tabela Endereco, que gera IDs sequenciais automáticos para mapear as localizações físicas no sistema.
CREATE TABLE Endereco (
    id_endereco SERIAL PRIMARY KEY,
    estado VARCHAR(255),
    cidade VARCHAR(255),
    bairro VARCHAR(255),
    pais VARCHAR(255)
);

-- Comando A4. comando para criar a tabela Publicacao, que registra as postagens associando cada uma delas ao seu criador (Usuario) e ao local correto (Endereco).
CREATE TABLE Publicacao (
    id_publicacao SERIAL PRIMARY KEY,
    descricao VARCHAR(255),
    data_publicacao DATE DEFAULT CURRENT_DATE,
    usuario VARCHAR(50),
    id_endereco INT,
    FOREIGN KEY (usuario) REFERENCES Usuario(usuario),
    FOREIGN KEY (id_endereco) REFERENCES Endereco(id_endereco)
);

-- Comando A5. comando para criar a tabela Mensagem, usada para controlar o envio de textos entre destinatários e remetentes com chaves compostas e remoção automática se o usuário for excluído.
CREATE TABLE Mensagem (
    destinatario VARCHAR(50),
    remetente VARCHAR(50),
    texto VARCHAR(1000),
    data_mensagem DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (destinatario) REFERENCES Usuario(usuario) ON DELETE CASCADE,
    FOREIGN KEY (remetente) REFERENCES Usuario(usuario) ON DELETE CASCADE,
    PRIMARY KEY (destinatario, remetente)
);

-- Comando A6. comando para criar a tabela Colabora, mapeando o relacionamento de coautoria entre os usuários e as publicações criadas.
CREATE TABLE Colabora (
    id_publicacao INT,
    usuario VARCHAR(50),
    FOREIGN KEY (id_publicacao) REFERENCES Publicacao(id_publicacao),
    FOREIGN KEY (usuario) REFERENCES Usuario(usuario),
    PRIMARY KEY (id_publicacao, usuario)
);

-- Comando A7. comando para criar a tabela Curte, responsável por gerenciar quais usuários reagiram de forma positiva a quais publicações.
CREATE TABLE Curte (
    id_publicacao INT,
    usuario VARCHAR(50),
    FOREIGN KEY (id_publicacao) REFERENCES Publicacao(id_publicacao),
    FOREIGN KEY (usuario) REFERENCES Usuario(usuario),
    PRIMARY KEY (id_publicacao, usuario)
);

-- Comando A8. comando para criar a tabela Perfil_Link, que armazena endereços web externos adicionados pelos usuários aos seus perfis de forma exclusiva.
CREATE TABLE Perfil_Link (
    link VARCHAR(255),
    usuario VARCHAR(50),
    FOREIGN KEY (usuario) REFERENCES Usuario(usuario) ON DELETE CASCADE,
    PRIMARY KEY (link, usuario)
);

-- Comando A9. comando para criar a tabela Publicacao_Fotos, permitindo vincular múltiplos caminhos de arquivos de imagem a uma mesma publicação.
CREATE TABLE Publicacao_Fotos (
    fotos_publicacao VARCHAR(255),
    id_publicacao INT,
    FOREIGN KEY (id_publicacao) REFERENCES Publicacao(id_publicacao),
    PRIMARY KEY (fotos_publicacao, id_publicacao)
);

-- Comando A10. comando para criar a tabela Publicacao_Videos, que armazena os links ou caminhos de arquivos de vídeo anexados às postagens realizadas.
CREATE TABLE Publicacao_Videos (
    videos_publicacao VARCHAR(255),
    id_publicacao INT,
    FOREIGN KEY (id_publicacao) REFERENCES Publicacao(id_publicacao),
    PRIMARY KEY (videos_publicacao, id_publicacao)
);

-- Comando A11. comando para criar a tabela Comentario, que viabiliza a inserção de textos de opinião ou resposta dos usuários nas publicações existentes.
CREATE TABLE Comentario (
    id_publicacao INT,
    usuario VARCHAR(50),
    texto VARCHAR(1000),
    data_comentario DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (id_publicacao) REFERENCES Publicacao(id_publicacao) ON DELETE CASCADE,
    FOREIGN KEY (usuario) REFERENCES Usuario(usuario) ON DELETE CASCADE,
    PRIMARY KEY (id_publicacao, usuario)
);