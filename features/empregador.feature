Feature: Empregador
  as a empregador
  I want to adicionar, remover, vizualizar, e editar um empregador



  Scenario: Criar empregador com sucesso
    Given que eu estou na página de criação de empregador
    And preencho o campo "Nome" com "Maria Silva"
    And preencho o campo "Nome da Empresa" com "Empresa XYZ"
    And preencho o campo "Email" com "maria.silva@example.com"
    And encho o campo "Endereço" com "Rua A, 123"
    And preencho o campo "Telefone" com "(11) 5555-5555"
    And preencho o campo "CNPJ" com "12.345.678/0001-00"
    When eu clico em "Criar Empregador"
    Then eu vejo uma mensagem que informa que o empregador foi criado com sucesso

  Scenario: Atualizar empregador com sucesso
    Given que eu estou na página de edição do empregador com nome "Maria Silva"
    And atualizo o campo "Nome da Empresa" com "Empresa ABC"
    And atualizo o campo "Telefone" com "(11) 4444-4444"
    When eu clico em "Salvar"
    Then eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso



  Scenario: Excluir empregador com sucesso
    Given que eu tenho o empregador "Maria Silva" na lista de empregadores
    When eu clico no botão de excluir do empregador "Maria Silva"
    And confirmo a exclusão do empregador
    Then eu vejo uma mensagem que informa que o empregador foi excluído com sucesso



  Scenario: Visualizar detalhes do empregador
    Given que eu tenho o empregador "Maria Silva" na lista de empregadores
    When eu clico no link de detalhes do empregador "Maria Silva"
    Then eu vejo os seguintes detalhes do empregador:
      | Nome          | Maria Silva       |
      | Nome da Empresa | Empresa XYZ     |
      | Email         | maria.silva@example.com |
      | Endereço      | Rua A, 123        |
      | Telefone      | (11) 5555-5555    |
      | CNPJ          | 12.345.678/0001-00 |


  Scenario: Ver a lista de empregadores
    Given que eu tenho os seguintes empregadores na base de dados:
      | Nome          | Nome da Empresa | Email             | Endereço           | Telefone        | CNPJ             |
      | Maria Silva   | Empresa XYZ     | maria.silva@example.com | Rua A, 123 | (11) 5555-5555    | 12.345.678/0001-00 |
