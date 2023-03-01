Feature: Candidato
  As a candidato
  I want to criar, deletar ou editar cadastro
  So that mantenho o cadastro atualizado e correto

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

  

