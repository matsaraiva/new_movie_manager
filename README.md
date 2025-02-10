# README - Movie Manager

## Visão Geral

O Movie Manager é um aplicativo web que permite aos usuários visualizar uma lista de filmes e realizar buscas por título. Este projeto foi desenvolvido utilizando Ruby on Rails e Mongoid como banco de dados.

## Funcionalidades

- **Listagem de filmes**: Exibe uma lista de filmes disponíveis.
- **Busca de filmes**: Permite aos usuários buscar filmes por título.

## Tecnologias Utilizadas

- Ruby on Rails 7
- Mongoid (MongoDB)
- [Outras gems ou tecnologias relevantes]

## Dependências

- Ruby 3.2.2
- Bundler (para gerenciamento de gems)
- Docker e Docker Compose
- Node.js e Yarn (se aplicável)
- [Outras dependências do sistema]

## Configuração e Instalação

1. **Clone o repositório:**

    ```bash
    git clone https://github.com/matsaraiva/new_movie_manager.git
    cd new_movie_manager
    ```

2. **Instale as gems:**

    ```bash
    bundle install
    ```

3. **Configure o banco de dados:**

    - **Mongoid:**
      - Certifique-se de que o Mongoid esteja configurado corretamente no arquivo `config/mongoid.yml`.

      ```yaml
      development:
        clients:
          default:
            database: movie_manager_development
            hosts:
              - localhost:27017
            options:
              server_selection_timeout: 5
        options:
          raise_not_found_error: false

      test:
        clients:
          default:
            database: movie_manager_test
            hosts:
              - localhost:27017
            options:
              read:
                mode: :primary
              max_pool_size: 1

      production:
        clients:
          default:
            database: movie_manager_production
            hosts:
              - db:27017
            options:
              server_selection_timeout: 5
        options:
          raise_not_found_error: false
      ```

4. **Instale as dependências de JavaScript (se aplicável):**

    ```bash
    yarn install # Ou npm install, dependendo do seu gerenciador de pacotes
    ```

## Executando o Aplicativo com Docker

1. **Inicie os contêineres com Docker Compose:**

    ```bash
    docker-compose up --build
    ```

2. **Acesse o aplicativo:**

    Abra o seu navegador e navegue para `http://localhost:3000`.

## Detalhes sobre a Conexão com o Banco de Dados

A conexão com o banco de dados MongoDB é configurada no arquivo `config/mongoid.yml`. Certifique-se de que a configuração está correta para os diferentes ambientes (development, test, production). No ambiente de produção, o MongoDB é configurado para se conectar ao contêiner `db`.

## Descrição dos Endpoints da API OMDb Utilizados e Integração

- **Endpoint de Busca por Título:**
  - URL: `http://www.omdbapi.com/?s=<título>&apikey=<sua_api_key>`
  - Descrição: Busca filmes por título.

- **Endpoint de Detalhes do Filme:**
  - URL: `http://www.omdbapi.com/?i=<imdb_id>&apikey=<sua_api_key>`
  - Descrição: Obtém detalhes completos de um filme usando o ID do IMDb.

### Integração com a API OMDb

A integração com a API OMDb é feita através de um serviço `OmdbService`. Aqui está um exemplo básico de como o serviço está configurado:

```ruby
class OmdbService
  include HTTParty
  base_uri 'http://www.omdbapi.com'
  API_KEY = 'sua_chave_api_aqui'

  def search_movies(query)
    self.class.get("/", query: { s: query, apikey: API_KEY })
  end

  def get_movie_details(imdb_id)
    self.class.get("/", query: { i: imdb_id, apikey: API_KEY })
  end
end
```