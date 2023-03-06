Feature: Empregador
  as a empregador
  I want to adicionar, remover, visualizar, e editar um empregador
  So that mantenho o cadastro atualizado e correto


  Scenario: Criar empregador com sucesso
    Given que eu estou na página de criação de empregador
    When preencho os campos de informações do empregador
    And Clico em "Cadastrar Empregador"
    Then eu vejo uma mensagem que informa que o empregador foi criado com sucesso

  Scenario: Atualizar empregador com sucesso
    Given que eu estou na página de edição do empregador com nome "Maria Silva"
    When preencho os campos que desejo atualizar
    And  Clico em "Editar Empregador"
    Then eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso



  Scenario: Excluir empregador com sucesso
    Given que eu tenho o empregador "Maria Silva" na lista de empregadores
    When eu clico no botão de excluir do empregador "Maria Silva"
    Then eu vejo uma mensagem que informa que o empregador foi excluído com sucesso
    And o Cadastro sera excluído



  Scenario: Visualizar detalhes do empregador
    Given que eu tenho o empregador "Maria Silva" na lista de empregadores
    When eu clico no link de detalhes do empregador "Maria Silva"
    Then eu vejo os seguintes detalhes do empregador
      | Nome          | Maria Silva       |
      | Nome da Empresa | Empresa XYZ     |
      | Email         | maria.silva@example.com |
      | Endereco      | Rua A, 123        |
      | Telefone      | (11) 5555-5555    |
      | CNPJ          | 12.345.678/0001-00 |


  Scenario: Ver a lista de empregadores
    Given que eu tenho os seguintes empregadores na base de dados
    Then eu vejo a lista de empregadores com os seguintes dados:
      | Nome          | Nome da Empresa | Email             | Endereco           | Telefone        | CNPJ             |
    | Maria Silva   | Empresa XYZ     | maria.silva@example.com | Rua A, 123 | (11) 5555-5555    | 12.345.678/0001-00 |


