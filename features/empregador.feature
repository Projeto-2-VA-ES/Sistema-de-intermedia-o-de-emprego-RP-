Feature: Empregador
  as a empregador
  I want to adicionar, remover, visualizar, e editar um empregador
  So that mantenho o cadastro atualizado e correto


  Scenario: Criar empregador com sucesso
    Given O empregador de nome: "Maria Silva", nomeEmpresa: "Empresa XYZ", email: 'maria.silva@example.com', endereco: 'Rua A, 123', telefone: '(11) 5555-5555', cnpj: '12.345.678/0001-00' existe
    And estou na pagina do empregador criado com nome 'Maria Silva'
    When eu clico em criar Empregador
    Then eu vejo uma mensagem que informa que o empregador foi criado com sucesso

  Scenario: Atualizar empregador com sucesso
    Given estou na pagina de empregadores
    And clico em mostar o empregador desejado
    And clico para editar este empregador
    When preencho os campos que desejo atualizar: email: 'maria.silva023@example.com', nomeEmpresa: 'Empresa ABC'
    And  Clico em "Editar Empregador"
    Then eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso


  Scenario: Excluir empregador com sucesso
    Given estou na pagina de empregadores
    And clico em mostar o empregador desejado
    When eu clico no botão de excluir do empregador
    Then eu vejo uma mensagem que informa que o empregador foi excluído com sucesso

  Scenario: Criar empregador sem sucesso
    Given Estou na pagina de cadastrar um empregador
    When Preencho os campos de cadastro com os seguintes dados: nome: "Rian Wilker", nomeEmpresa: "Empresa ABC", email: "", endereco: "Rua B, 123", telefone: "(87)999469999", cnpj: "12.345.678/0001-00"
    And eu clico em criar Empregador
    Then eu vejo uma mensagem que informa que o empregador não pode ser cadastrado com esse email

  Scenario: Criar empregador sem sucesso
    Given Estou na pagina de cadastrar um empregador
    When Preencho os campos de cadastro com os seguintes dados: nome: "", nomeEmpresa: "Empresa ABC", email: "rianwilker17@gmail.com", endereco: "Rua B, 123", telefone: "(87)999469999", cnpj: "12.345.678/0001-00"
    And eu clico em criar Empregador
    Then eu vejo uma mensagem que informa que o empregador não pode ser cadastrado com esse nome