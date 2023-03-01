Feature: Candidato
  As a candidato
  I want to criar, deletar ou editar cadastro
  So that mantenho o cadastro atualizado e correto

  #CRIAR CADASTRO
  Scenario: Criar cadastro com informações válidas
    Given que estou na página de cadastro de candidato
    When preencho os campos obrigatórios com informações válidas
    And clico em "Salvar"
    Then devo ver uma mensagem de confirmação
    And meu cadastro deve ser salvo no banco de dados

  Scenario: Tentar criar cadastro com informações inválidas
    Given que estou na página de cadastro de candidato
    When preencho os campos obrigatórios com informações inválidas
    And clico em "Salvar"
    Then devo ver uma mensagem de erro indicando quais campos precisam ser corrigidos

  Scenario: Tentar criar cadastro sem preencher campos obrigatórios
    Given que estou na página de cadastro de candidato
    When não preencho todos os campos obrigatórios
    And clico em "Salvar"
    Then devo ver uma mensagem de erro indicando quais campos são obrigatórios

    #DELETAR CADASTRO
  Scenario: Deletar cadastro existente
    Given que estou na página de listagem de candidatos
    When clico no botão "Deletar" do candidato que desejo excluir
    And confirmo a operação
    Then devo ver uma mensagem de confirmação
    And o cadastro deve ser excluído do banco de dados

  Scenario: Tentar deletar cadastro inexistente
    Given que estou na página de listagem de candidatos
    When tento deletar um cadastro que não existe
    Then devo ver uma mensagem de erro indicando que o cadastro não foi encontrado





