# language: pt
  @FluxoCompleto
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
        | Nacho    | NachodaMassa@hotmail.com  | 4000.02 |VAREJO      |
        | Hulk     | HulkaodaMassa@hotmail.com | 9800.15 |PERSONNALITE|
        | D. Costa | CostaodaMassa@hotmail.com | 7000.23 |UNICLASS    |
        | Cuca     | CuquinhaBrabo@hotmail.com | 1800.45 |VAREJO      |


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
      E eu fizer a requisicao PUT para atualizar o cliente
      Entao devera retornar o status code "200"
      E devera persistir o valor "<nome>" no campo "nome" no banco de dados
      E devera persistir o valor "<email>" no campo "email" no banco de dados
      E devera persistir o valor "<salario>" no campo "salario" no banco de dados
      E devera persistir o valor "<segmento>" no campo "segmento" no banco de dados
      Exemplos:
        | nome    | email                      | salario  |segmento    |
        | Everson | EversondaMassa@hotmail.com | 9000.22  |PERSONNALITE|


    @ListarUmCliente @FluxoPrincipal
    Cenario: Validar Listagem de um Cliente
      Dado que eu tenha clientes cadastrados
      E guardar o valor do id do cliente
      Quando eu fizer a requisicao Get para listagem de um cliente
      Entao devera retornar o status code "200"
      E devera retornar esse cliente cadastrado

    @RequisicaoPostSemCampos @FluxoAlternativo
    Esquema do Cenário: Validar requisicao POST com algum campo em branco
      Dado eu tenha os seguintes campos do cliente nome "<nome>" email "<email>" salario "<salario>" preenchidos
      Quando eu fizer a requisicao Post para cadastrar o cliente
      Entao devera retornar o status code "400"
      E devera retornar o campo "<campo>" que deu erro e a mensagem "<mensagem>"

      Exemplos:
        | nome     | email                     | salario | campo   | mensagem                         |
        |          | NachodaMassa@hotmail.com  | 4000.02 | nome    | Nome não deve estar em branco.   |
        | Hulk     |                           | 9800.15 | email   | Email não deve estar em branco.   |
        | D. Costa | CostaodaMassa@hotmail.com |         | salario | Salario não deve estar em branco. |

    @RequisicaoPostEmailIncorreto @FluxoAlternativo
    Esquema do Cenário: Validar requisicao POST com email com formato incorreto
      Dado eu tenha os seguintes campos do cliente nome "<nome>" email "<email>" salario "<salario>" preenchidos
      Quando eu fizer a requisicao Post para cadastrar o cliente
      Entao devera retornar o status code "400"
      E devera retornar o campo "<campo>" que deu erro e a mensagem "<mensagem>"

      Exemplos:
        | nome     | email                     | salario | campo    | mensagem                            |
        | Nacho    | NachodaMassahotmail.com   | 4000.02 | email    | Email não esta no formato correto.  |

    @RequisicaoPostTodosCamposEmBranco @FluxoAlternativo
    Cenario: Validar requisicao POST com todos os campos em branco
      Quando eu fizer a requisicao Post para cadastrar o cliente
      Entao devera retornar o status code "400"
      E devera retornar os campos "message" com o valor "Validation failed for object='cliente'. Error count: 3"


    @RequisicaoPutEmailIncorreto @FluxoAlternativo
    Esquema do Cenário: Validar requisicao PUT com email com formato incorreto
      Dado eu tenha os seguintes campos do cliente nome "<nome>" email "<email>" salario "<salario>" preenchidos
      E eu fizer a requisicao PUT para atualizar o cliente
      Entao devera retornar o status code "400"
      E devera retornar o campo "<campo>" que deu erro e a mensagem "<mensagem>"

      Exemplos:
        | nome     | email                     | salario | campo    | mensagem                            |
        | Nacho    | NachodaMassahotmail.com   | 4000.02 | email    | Email não esta no formato correto.  |

    @RequisicaoPutTodosCamposEmBranco @FluxoAlternativo
    Cenario: Validar requisicao PUT com todos os campos em branco
      E eu fizer a requisicao PUT para atualizar o cliente
      Entao devera retornar o status code "400"
      E devera retornar os campos "message" com o valor "Validation failed for object='cliente'. Error count: 3"

    @RequisicaoPutSemCampos @FluxoAlternativo
    Esquema do Cenário: Validar requisicao PUT com algum campo em branco
      Dado que eu tenha clientes cadastrados
      E guardar o valor do id do cliente
      E eu alterar os dados do cliente nome "<nome>" email "<email>" salario "<salario>"
      Quando eu fizer a requisicao PUT para atualizar o cliente
      Entao devera retornar o status code "400"
      E devera retornar o campo "<campo>" que deu erro e a mensagem "<mensagem>"

      Exemplos:
        | nome     | email                     | salario | campo   | mensagem                          |
        |          | NachodaMassa@hotmail.com  | 4000.02 | nome    | Nome não deve estar em branco.    |
        | Hulk     |                           | 9800.15 | email   | Email não deve estar em branco.   |
        | D. Costa | CostaodaMassa@hotmail.com |         | salario | Salario não deve estar em branco. |