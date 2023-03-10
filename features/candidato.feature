Feature: Candidato
  As a candidato
  I want to criar, deletar ou editar cadastro
  So that mantenho o cadastro atualizado e correto

  #CRIAR CADASTRO
  Scenario: Criar cadastro com informacoes validas
    Given que eu estou na pagina de cadastro de candidato
    When eu preencho os campos obrigatorios com informacoes validas
    And clico em "Salvar Candidato"
    Then devo ver uma mensagem de confirmacao

  Scenario: Tentar criar cadastro com informacoes invalidas
    Given que estou na pagina de cadastro de candidato
    When preencho os campos obrigatorios com informacoes invalidas
    And clico em "Salvar Candidato"
    Then vejo uma mensagem de erro indicando quais campos precisam ser corrigidos

  Scenario: Tentar criar cadastro sem preencher campos obrigatorios
    Given que estou na pagina de cadastro de candidato
    When nao preencho todos os campos obrigatorios
    And clico em "Salvar Candidato"
    Then vejo uma mensagem de erro indicando quais campos sao obrigatorios

    #DELETAR CADASTRO
  Scenario: Deletar cadastro existente
    Given que estou na pagina de listagem de candidatos
    When clico no botao "Deletar Candidato" do candidato que desejo excluir
    And confirmo a operacao
    Then vejo uma mensagem de confirmacao

  Scenario: Tentar deletar cadastro inexistente
    Given que estou na pagina de listagem de candidatos
    When tento deletar um cadastro que nao existe
    Then devo ver uma mensagem de erro indicando que o cadastro nao foi encontrado

    #EDITAR CADASTRO
  Scenario: Editar cadastro existente com informacoes validas
    Given que estou na pagina de edicao de um cadastro existente
    When preencho os campos que desejo atualizar com informacoes validas
    And clico em "Salvar Candidato"
    Then devo ver uma mensagem de confirmacao

  Scenario: Tentar editar cadastro inexistente
    Given que tento acessar a página de edicao de um cadastro que não existe
    Then devo ver uma mensagem de erro indicando que o cadastro nao foi encontrado

    #VALIDAR CAMPOS DO CADASTRO
  Scenario: Validar campos obrigatorios do cadastro
    Given que estou na pagina de cadastro de candidato
    When não preencho os campos obrigatorios
    And clico em "Salvar Candidato"
    Then devo ver uma mensagem de erro indicando quais campos sao obrigatorios

  Scenario: Validar formato do campo de email
    Given que estou na pagina de cadastro de candidato
    When preencho o campo de email com um valor invalido
    And clico em "Salvar Candidato"
    Then devo ver uma mensagem de erro indicando que o email é invalido

  Scenario: Validar formato do campo de telefone
    Given que estou na pagina de cadastro de candidato
    When preencho o campo de telefone com um valor invalido
    And clico em "Salvar Candidato"
    Then devo ver uma mensagem de erro indicando que o telefone é invalido







