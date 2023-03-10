Feature: Vaga
  as a empregador
  I want to adicionar, remover, visualizar, e editar uma vaga
  So that mantenho as vagas atualizadas e corretas de acordo com a necessidade


  Scenario: Criar vaga com sucesso
    Given que estou logado como um usuario com permissao para gerenciar vagas
    When acesso a pagina de gerenciamento de vagas
    And clico no botao para adicionar uma nova vaga
    Then sou direcionado para a pagina de criacao de vaga
    And preencho todos os campos obrigatorios
    And clico em salvar
    Then a nova vaga e criada com sucesso
    And sou redirecionado de volta para a pagina de gerenciamento de vagas
    And a nova vaga aparece na lista de vagas

  Scenario: Atualizar vaga com sucesso
    Given que estou logado como um usuario com permissao para gerenciar vagas
    When acesso a pagina de gerenciamento de vagas
    And seleciono uma vaga da lista de vagas
    And clico no botao para editar a vaga
    Then sou redirecionado para a pagina de edição de vaga
    And altero as informacoes da vaga
    And clico em salvar
    Then as informacoes da vaga sao atualizadas com sucesso
    And sou redirecionado de volta para a pagina de gerenciamento de vagas
    And as informacoes atualizadas da vaga aparecem na lista de vagas


  Scenario: Excluir vaga com sucesso
    Given que estou logado como um usuario com permissao para gerenciar vagas
    When acesso a pagina de gerenciamento de vagas
    And seleciono uma vaga da lista de vagas
    And clico no botao para remover a vaga
    Then a vaga foi removida com sucesso
    And sou redirecionado de volta para a pagina de gerenciamento de vagas
    And a nova vaga aparece na lista de vagas


  Scenario: Visualizar detalhes da vaga
    Given que estou logado como um usuario com permissao para gerenciar vagas
    When acesso a pagina de gerenciamento de vagas
    And seleciono uma vaga da lista de vagas
    Then visualizo todas as informacoes da vaga


  Scenario: Ver a lista de vagas
    Given que estou logado como um usuario com permissao para gerenciar vagas
    When acesso a pagina de gerenciamento de vagas
    Then visualizo a lista completa de vagas cadastradas