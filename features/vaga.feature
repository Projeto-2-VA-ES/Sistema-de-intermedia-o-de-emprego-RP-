Feature: Vaga
  As a empregador
  I want to adicionar, remover, visualizar, e editar uma vaga
  So that mantenho o cadastro atualizado e correto

  # Criar vaga
  Scenario: Criar vaga com sucesso
    Given que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00"
    And eu clico em 'Criar Vaga'
    Then eu devo ser redirecionado para a pagina da vaga recem-criada e vejo a mensagem "Vaga criada com sucesso"

  Scenario: Criar vaga sem sucesso
    Given que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "Desenvolvedor Ruby", descricao: "", salario: "R$ 5.000,00"
    And eu clico em 'Criar Vaga'
    Then eu vejo uma mensagem que informa que a vaga não pode ser cadastrada com essa descricao


  # Visualizar vaga
  Scenario: Visualizar vaga com sucesso
    Given a vaga de titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00" existe
    And que eu esteja na pagina de listagem de vagas
    When eu clico no botao 'Visualizar' da vaga com titulo: "Densenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00"
    Then eu devo ser redirecionado para a pagina da vaga selecionada e vejo a mensagem "Descricao da vaga:"

  # Editar vaga
  Scenario: Editar vaga com sucesso
    Given a vaga de titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00" existe
    And que eu esteja na pagina de edicao de vaga
    When eu altero os campos desejados da vaga, preenchendo a descricao com "Vaga para desenvolvedor Ruby on Rails" e clico em 'Atualizar Vaga'
    Then eu devo ser redirecionado para a pagina atualizada da vaga e vejo a mensagem "Vaga atualizada com sucesso"

  # Remover vaga
  Scenario: Remover vaga com sucesso
    Given a vaga de titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00" existe
    And que eu esteja na pagina de listagem de vagas
    When eu clico no botao 'Remover' da vaga com titulo: "Densenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00"
    Then eu devo ser redirecionado para a pagina atualizada da vaga e vejo uma mensagem dizendo "Vaga removida com sucesso!"


