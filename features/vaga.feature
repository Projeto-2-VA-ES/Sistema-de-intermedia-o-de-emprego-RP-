Feature: Vaga
  As a empregador
  I want to adicionar, remover, visualizar, e editar uma vaga
  So that mantenho o cadastro atualizado e correto

   #Criar vaga
  Scenario: Criar vaga com sucesso
    Given O empregador de nomeEmpresa: "Empresa ABC", nome: "João da Silva", endereco: 'Rua B, 456', email: 'joao.silva@example.com', cnpj: '98.765.432/0001-99', telefone: '11-44444-4444' existe
    And que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00"
    And eu clico em criar Vaga
    Then eu devo ser redirecionado para a pagina da vaga recem-criada e vejo a mensagem "Vaga criada com sucesso"

  Scenario: Criar vaga sem sucesso 1
    Given O empregador de nomeEmpresa: "Empresa ABC", nome: "João da Silva", endereco: 'Rua B, 456', email: 'joao.silva@example.com', cnpj: '98.765.432/0001-99', telefone: '11-44444-4444' existe
    And que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "Desenvolvedor Ruby", descricao: "", salario: "R$ 5.000,00"
    And eu clico em criar Vaga
    Then eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com essa descricao

  Scenario: Criar vaga sem sucesso 2
    Given O empregador de nomeEmpresa: "Empresa ABC", nome: "João da Silva", endereco: 'Rua B, 456', email: 'joao.silva@example.com', cnpj: '98.765.432/0001-99', telefone: '11-44444-4444' existe
    And que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00"
    And eu clico em criar Vaga
    Then eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com esse titulo

  Scenario: Criar vaga sem sucesso 3
    Given O empregador de nomeEmpresa: "Empresa ABC", nome: "João da Silva", endereco: 'Rua B, 456', email: 'joao.silva@example.com', cnpj: '98.765.432/0001-99', telefone: '11-44444-4444' existe
    And que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "Desenvolvedor Ruby", descricao: "", salario: ""
    And eu clico em criar Vaga
    Then eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com a descricao e o salario em branco

  Scenario: Criar vaga sem sucesso 4
    Given O empregador de nomeEmpresa: "Empresa ABC", nome: "João da Silva", endereco: 'Rua B, 456', email: 'joao.silva@example.com', cnpj: '98.765.432/0001-99', telefone: '11-44444-4444' existe
    And que eu esteja na pagina de criacao de vaga
    When eu preencho os campos obrigatorios com os dados da vaga titulo: "", descricao: "Vaga para desenvolvedor Ruby", salario: ""
    And eu clico em criar Vaga
    Then eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com salario em branco


   #Editar vaga
  #Scenario: Editar vaga com sucesso
    #Given a vaga de titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00" existe
    #When que eu esteja na pagina de edicao de vaga
    #And altero os campos desejados da vaga, preenchendo a descricao com "Vaga para desenvolvedor Ruby on Rails"
    #And e clico para atualizar vaga
    #Then aparece a mensagem de confirmacao na tela que a vaga atualizada com sucesso

   #Remover vaga
  #Scenario: Remover vaga com sucesso
    #Given a vaga de titulo: "Desenvolvedor Ruby", descricao: "Vaga para desenvolvedor Ruby", salario: "R$ 5.000,00" existe
    #When que eu esteja na pagina de listagem de vagas
    #And clico no botao para deletar a vaga
    #Then aparece uma mensagem dizendo a vaga foi removida com sucesso



