Feature: Vaga
  as a empregador
  I want to adicionar, remover, vizualizar, e editar uma vaga
  So that mantenho as vagas atualizadas e corretas de acordo com a necessidade


  Scenario: Criar vaga com sucesso
    Given que estou logado como um usuário com permissão para gerenciar vagas
    When acesso a página de gerenciamento de vagas
    And clico no botão para adicionar uma nova vaga
    Then sou direcionado para a página de criação de vaga
    And preencho todos os campos obrigatórios
    And clico em salvar
    Then a nova vaga é criada com sucesso
    And sou redirecionado de volta para a página de gerenciamento de vagas
    And a nova vaga aparece na lista de vagas

  Scenario: Atualizar vaga com sucesso
    Given que estou logado como um usuário com permissão para gerenciar vagas
    When acesso a página de gerenciamento de vagas
    And seleciono uma vaga da lista de vagas
    And clico no botão para editar a vaga
    Then sou redirecionado para a página de edição de vaga
    And altero as informações da vaga
    And clico em salvar
    Then as informações da vaga são atualizadas com sucesso
    And sou redirecionado de volta para a página de gerenciamento de vagas
    And as informações atualizadas da vaga aparecem na lista de vagas


  Scenario: Excluir vaga com sucesso
    Given que estou logado como um usuário com permissão para gerenciar vagas
    When acesso a página de gerenciamento de vagas
    And seleciono uma vaga da lista de vagas
    And clico no botão para remover a vaga
    Then a vaga é removida com sucesso
    And sou redirecionado de volta para a página de gerenciamento de vagas
    And a nova vaga aparece na lista de vagas


  Scenario: Visualizar detalhes da vaga
    Given que estou logado como um usuário com permissão para gerenciar vagas
    When acesso a página de gerenciamento de vagas
    And seleciono uma vaga da lista de vagas
    Then visualizo todas as informações da vaga


  Scenario: Ver a lista de vagas
    Given que estou logado como um usuário com permissão para gerenciar vagas
    When acesso a página de gerenciamento de vagas
    Then visualizo a lista completa de vagas cadastradas