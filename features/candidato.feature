Feature: Candidato
  As a candidato
  I want to criar, deletar ou editar cadastro
  So that mantenho o cadastro atualizado e correto

  #CRIAR CADASTRO
  Scenario: Criar cadastro com informacoes validas
    Given que eu estou na pagina de cadastro de candidato
    When eu preencho os campos obrigatorios com informacoes validas
    And clico em Salvar Candidato
    Then devo ver uma mensagem de confirmacao

  Scenario: Criar cadastro com informacoes invalidas
    Given que estou na pagina de cadastro de candidato
    When preencho o campo de email com um valor invalido
    And clico em Salvar Candidato
    Then devo ver uma mensagem de erro indicando que o email é invalido

  Scenario: Tentar criar cadastro sem preencher campos obrigatorios
    Given que estou na pagina de cadastro de candidato
    When nao preencho todos os campos obrigatorios
    And clico em Salvar Candidato
    Then vejo uma mensagem de erro indicando quais campos sao obrigatorios

    #DELETAR CADASTRO
  Scenario: Excluir candidato com sucesso
    Given que o candidato de nome: "Victor Santos", email: "victor@gmail.com", cpf: "11111111176", dataNascimento: "21-01-2001", telefone: "87-99999-6666" existe
    And o curriculo de nome: "Joao", objetivo:"Trabalhar na área administrativa", experiencia_profissional:"10 anso na área", formacao_academica:"Administração", habilidades:"inglês fluente" existe
    When estou na pagina de candidatos
    And visito o candidato desejado
    And eu clico no botão de deletar candidato
    Then eu vejo uma mensagem que informa que o candidato foi excluído com sucesso

    #EDITAR CADASTRO
  Scenario: Editar candidato com sucesso
    Given que o candidato de nome: "Victor Santos", email: "victor@gmail.com", cpf: "11111111176", dataNascimento: "21-01-2001", telefone: "87-99999-6666" existe
    And o curriculo de nome: "Joao", objetivo:"Trabalhar na área administrativa", experiencia_profissional:"10 anso na área", formacao_academica:"Administração", habilidades:"inglês fluente" existe
    When estou na pagina de candidatos
    And visito o candidato desejado
    And eu clico no link de editar candidato
    And preencho os campos que desejo atualizar com informacoes validas
    And clico em Atualizar Candidato
    Then devo ver uma mensagem de confirmacao da atualizacao











