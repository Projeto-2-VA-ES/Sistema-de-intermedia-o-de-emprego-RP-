Feature: gerenciar uma candidatura
  As a candidato
  I want to candidatar em uma vaga  no site de emprego
  So that eu possa  concorrer a uma vaga

  :nome, :nomeEmpresa, :email, :endereco, :telefone, :cnpj

  Scenario: Criar uma candidatura
    Given que existe um candidato chamado "João" com e-mail "joao@example.com" com o cpf "11498786427" com a data "20/11/2001" e com o seguinte numero "87-99946-9995"
    And  que existe um empregador chamdo "Paulo" com a empresa "Empresa ABC" com o email "paulo@example.com" com o endereco "Rua ponte" com o telefone "87-99945-9896" e com o cnpj "44.935.624/0001-76"
    And  criou a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Candidato confiante" e Salario: "2500"
    When  acesso a página de candidatura da vaga de emprego
    And preencho minha mensagem de candidatura com "Tenho experiencia com ruby on rails" e seleciono a vaga desejada
    And clica no botão para criar a candidatura
    Then aparece uma mensagem de confirmação na tela que a candidatura foi criada


  Scenario: Deletar uma candidatura
    Given que existe uma candidatura para a vaga "Dev junior ruby on rails" feita pelo candidato "João"
    When acesso a página de listagem de candidaturas
    And clico no botão para deletar a candidatura
    Then aparece uma mensagem de confirmação na tela que a candidatura foi deletada