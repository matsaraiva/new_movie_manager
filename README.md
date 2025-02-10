# README - Movie Manager

Este README descreve os passos necessários para executar o aplicativo Movie Manager, um projeto desenvolvido como parte de um desafio de programação.

## Visão Geral

O Movie Manager é um aplicativo web simples que permite aos usuários visualizar uma lista de filmes e realizar buscas por título.  Este projeto foi desenvolvido utilizando Ruby on Rails e Mongoid como banco de dados.

## Funcionalidades

*   Listagem de filmes: Exibe uma lista de filmes disponíveis.
*   Busca de filmes: Permite aos usuários buscar filmes por título.

## Tecnologias Utilizadas

*   Ruby on Rails 7 (ou a versão que você utilizou)
*   Mongoid (ou o banco de dados que você utilizou)
*   [Outras gems ou tecnologias relevantes]

## Dependências

*   Ruby (especifique a versão)
*   Bundler (para gerenciamento de gems)
*   Node.js e Yarn (se você utilizou Javascript e/ou frontend framework)
*   [Outras dependências do sistema]

## Configuração

1.  **Clone o repositório:**

    ```bash
    git clone [https://github.com/seu_nome_de_usuario/nome_do_repositorio.git](https://www.google.com/search?q=https://github.com/seu_nome_de_usuario/nome_do_repositorio.git)
    cd nome_do_repositorio
    ```

2.  **Instale as gems:**

    ```bash
    bundle install
    ```

3.  **Configure o banco de dados:**

    *   **Mongoid:**
        *   Certifique-se de que o Mongoid esteja configurado corretamente no arquivo `config/mongoid.yml`.
        *   Execute as migrações do Mongoid:

        ```bash
        rails db:migrate
        ```

    *   **Outros bancos de dados:**
        *   Siga as instruções específicas para o seu banco de dados.

4.  **Instale as dependências de JavaScript (se aplicável):**

    ```bash
    yarn install # Ou npm install, dependendo do seu gerenciador de pacotes
    ```

## Executando o aplicativo

1.  **Inicie o servidor Rails:**

    ```bash
    rails server
    ```

2.  **Acesse o aplicativo:**

    Abra o seu navegador e navegue para `http://localhost:3000`.

## Próximos Passos

Este README será atualizado em breve com as seguintes informações:

*   **Vídeo de apresentação:** Um vídeo demonstrando a funcionalidade do aplicativo e o processo de desenvolvimento será adicionado ao repositório.
*   **Documentação completa:** A documentação detalhada do código, incluindo explicações sobre a arquitetura, os models, controllers e views, será incluída.