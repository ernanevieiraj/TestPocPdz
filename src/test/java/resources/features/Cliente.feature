# language: pt
  Funcionalidade: Testar as operacoes basicas de Cliente
    O sistema devera realizar as operacoes de insercao, delecao, atualizacao e visualizacao do cadastro de Clientes.
    Seguindo as restricoes que devera entrar com
      nome que nao pode estar em branco
      salario que devera ser maior que 0
      email com um formato email valido.


    @CadastroCliente @FluxoPrincipal
    Esquema do Cenário: Validar Cadastro de Cliente
      Dado que eu preencha o nome "<nome>" do cliente
      E preencha o email "<email>" do cliente
      E preencha o salario "<salario>" do cliente
      Quando eu fizer a requisicao Post para cadastrar o cliente
      Entao devera retornar o status code "201"
      E guardar o valor do id do cliente
      E devera persistir o valor "<nome>" no campo "nome" no banco de dados
      E devera persistir o valor "<email>" no campo "email" no banco de dados
      E devera persistir o valor "<salario>" no campo "salario" no banco de dados
      E devera persistir o valor "<segmento>" no campo "segmento" no banco de dados

      Exemplos:
        | nome     | email                     | salario | segmento   |
        | Nacho    | NachodaMassa@hotmail.com  | 4000.02 |varejo      |
        | Hulk     | HulkaodaMassa@hotmail.com | 9800.15 |personnalite|
        | D. Costa | CostaodaMassa@hotmail.com | 7000.23 |uniclass    |
        | Cuca     | CuquinhaBrabo@hotmail.com | 1800.45 |varejo      |


    @ListarClientes @FluxoPrincipal
    Cenario: Validar Listagem de Clientes
      Dado que eu tenha clientes cadastrados
      Quando eu fizer a requisicao Get para listagem de clientes
      Entao devera retornar o status code "200"
      E devera retornar os clientes cadastrados

    @DeletarCliente @FluxoPrincipal
    Cenario: Validar Delecao de Cliente
      Dado que eu tenha clientes cadastrados
      E guardar o valor do id do cliente
      Quando eu fizer a requisicao Del para delecao de cliente
      Entao devera retornar o status code "204"
      E devera apagar o registro do banco de dados

    @AtualizarCliente @FluxoPrincipal
    Esquema do Cenário: Validar Atualizacao de Cliente
      Dado que eu tenha clientes cadastrados
      E guardar o valor do id do cliente
      Quando eu alterar os dados do cliente nome "<nome>" email "<email>" salario "<salario>"
      E eu fizer a requisicao PUT para delecao de cliente
      Entao devera retornar o status code "200"
      E devera persistir o valor "<nome>" no campo "nome" no banco de dados
      E devera persistir o valor "<email>" no campo "email" no banco de dados
      E devera persistir o valor "<salario>" no campo "salario" no banco de dados
      E devera persistir o valor "<segmento>" no campo "segmento" no banco de dados
      Exemplos:
        | nome    | email                      | salario  |segmento    |
        | Everson | EversondaMassa@hotmail.com | 9000.22  |personnalite|


    @ListarUmCliente @FluxoPrincipal
    Cenario: Validar Listagem de um Cliente
      Dado que eu tenha clientes cadastrados
      E guardar o valor do id do cliente
      Quando eu fizer a requisicao Get para listagem de um cliente
      Entao devera retornar o status code "200"
      E devera retornar esse cliente cadastrado