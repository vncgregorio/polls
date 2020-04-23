# DESAFIO ENQUETE - Vinícius Gregório

## PRÉ - REQUISITOS

GNU Linux ([Ubuntu](https://ubuntu.com/download/desktop/thank-you?version=19.10&architecture=amd64) 19.10 no desenvolvimento)
[Ruby](https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.1.tar.gz) (versão 2.5.1)
Rails 5.2.1
MySQL (versão 14.14 no desenvolvimento)

## INSTALAÇÃO

É necessário configurar os acessos à base de dados no arquivo database.yml
A aplicação foi desenvolvida utilizando [MySQL](https://www.mysql.com/) como base de dados porém pode ser alterada para utilizar [PostgreSQL](https://www.postgresql.org/) ou outra base de dados com alterações no Gemfile (para o adaptador) e no database.yml.

Para utilização em máquina de desenvolvimento com outros projetos Rails em versões diferentes, recomendo a utilização de um sistema gestor de stacks de desenvolvimento, como o Rbenv ou RVM. No ambiente de desenvolvimento utilizei o [RVM](https://rvm.io/). Para replicar o ambiente de desenvolvimento, crie uma nova gemset com os comandos abaixo:

```
rvm gemset create rails-polls
rvm gemset use rails-polls
```

Após definir a gemset atual, execute o bundler para baixar todas as dependências do projeto:

```
bundle install
```

Após atualizar a gemset com as dependências da aplicação, é necessário inicializar a base de dados para a utilização:

```
rake db:create db:migrate db:seed
```

## DEPENDÊNCIAS

A aplicação utiliza as dependências abaixo:

[rspec](https://github.com/rspec/rspec-rails)
  Utilizei o RSpec para os testes unitários nos modelos e para os testes de endpoints da API (controller specs).

[shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
  Gem com DSL utilizada para facilitar o desenvolvimento dos testes integrados do sistema

[factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
  Utilizado para a geração de stubs para os testes automatizados.

[faker](https://github.com/faker-ruby/faker)
  Utilizado para a geração de dados fake para os stubs nos testes e para popular a base de dados de desenvolvimento.

[database_cleaner](https://github.com/DatabaseCleaner/database_cleaner)
  Gem utilizada para limpar e manter a base de dados de testes e stubs estáveis.

[seedbank](https://github.com/james2m/seedbank)
  Para organizar o carregamento da base de dados em diversas tabelas e, também, para não poluir um único arquivo de db/seeds.rb.

[annotate](https://github.com/ctran/annotate_models)
  Gem utilizada para gerar comentários e documentação em modelos e testes com o mapeamento das colunas em base de dados para um recurso

[auto_increment](https://github.com/felipediesel/auto_increment)
  Para facilitar e não poluir o código dos modelos para casos de atributos com comportamento de auto incremento baseado em escopo. Foi utilizado no desenvolvimento do número das opções de uma enquete, utilizando um atributo específico ao invés do id sequencial da base de dados.

[jbuilder](https://github.com/rails/jbuilder)
  Gem mantida pela equipe do Rails muito útil para simplificar a geração de respostas em json para APIs.

## SOBRE O PROJETO

## TESTES

Para rodar os testes:

```
rspec
```

ou

```
bundle exec rspec
```

Os teste foram cruciais para definir os relacionamentos entre as entidades propostas no exercício e também para garantir os códigos de resposta corretos para a API.

Para a padronização dos testes utilizei como referência:

[https://rspec.info/about/](https://rspec.info/about/)
[http://www.betterspecs.org/](http://www.betterspecs.org/)
[https://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/](https://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/)

## MELHORIAS SUGERIDAS
