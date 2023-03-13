Feature: Vaga
  As a empregador
  I want to adicionar, remover, visualizar, e editar uma vaga
  So that mantenho o cadastro atualizado e correto

  Scenario: Criar vaga com sucesso
    Given que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga: Titulo: "Desenvolvedor Ruby", Descricao: "Vaga para desenvolvedor Ruby", Salario: "R$ 5.000,00"
    And eu clico em 'Criar Vaga'
    Then eu devo ser redirecionado para a pagina da vaga recem-criada e vejo a mensagem "Vaga criada com sucesso"

  Scenario: Visualizar vaga com sucesso
    Given que eu esteja na pagina de listagem de vagas
    When eu clico no botao 'Visualizar' da vaga desejada
    Then eu devo ser redirecionado para a pagina da vaga selecionada e vejo a mensagem "Descricao da vaga:"

  Scenario: Editar vaga com sucesso
    Given que eu esteja na pagina de edicao de vaga
    When eu altero os campos desejados da vaga, preenchendo a Descricao com "Vaga para desenvolvedor Ruby on Rails" e clico em 'Atualizar Vaga'
    Then eu devo ser redirecionado para a pagina atualizada da vaga e vejo a mensagem "Vaga atualizada com sucesso"

  Scenario: Remover vaga com sucesso
    Given que eu esteja na pagina de listagem de vagas
    When eu clico no botao 'Remover' da vaga desejada
    Then a vaga deve ser removida da lista de vagas e eu nao vejo mais a vaga na lista

  Scenario: Ver lista de vagas
    Given que eu esteja na pagina inicial
    When eu clico no botao 'Ver Vagas'
    Then eu devo ser redirecionado para a pagina de listagem de vagas e vejo a mensagem "Lista de vagas"