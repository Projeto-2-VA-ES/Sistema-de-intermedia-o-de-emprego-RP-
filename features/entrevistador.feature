Feature: entrevistador
  As a entrevistador
  I want to agendar entrevistas com os candidatos atraves do sistema de vagas de emprego
  So that eu possa avaliar suas habilidades e qualificacoes para a posicao desejada e tomar uma decisão informada sobre a contratação.

  Scenario: criar um entrevistador
    Given que estou na pagina de cadastro de entrevistador
    Given que existe um empregador chamado "Josias da Silva" dono da empresa "Empresa LÁCTEA Doces" com o email "josias666@hotmail.com" com o endereco "Rua dos Bobos 50" com o telefone "81-99204-9895" e com o cnpj "11.935.624/0001-50"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Anos de Experiência" e Salario: "3000"
    When preencho meu cadastro de entrevistador nome: "Luiz Fellipe", email: "luiz@gmail.com", telefone: "87-99258-5522" e seleciono a vaga desejada pelo entrevistador do seguinte titulo de vaga "Dev junior ruby on rails"
    And clico no botao para salvar o entrevistador
    Then eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso

  Scenario: criar um entrevistador sem preencher todos os campos obrigatorios
    Given que estou na pagina de cadastro de entrevistador
    Given que existe um empregador chamado "Josias da Silva Jr" dono da empresa "Empresa Brasil" com o email "josias999@hotmail.com" com o endereco "Rua dos Bobos 20" com o telefone "87-99204-9895" e com o cnpj "10.935.624/0001-50"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "5 Anos de Experiência" e Salario: "3000"
    When nao preencho todos os campos obrigatorios para criação de entrevistador
    Then eu vejo uma mensagem que informa que o entrevistador nao foi criado e os motivos por tras disso

  Scenario: visualizar um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa ACB" com o email "carlos500@example.com" com o endereco "Rua Y" com o telefone "88-99845-9896" e com o cnpj "43.935.624/0001-00"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "10 Anos de Experiência" e Salario: "3000"
    When estou na pagina de entrevistador
    And visito o entrevistador desejado
    Then devo ver o nome do entrevistador e seus dados

  Scenario: Editar um entrevistador
    Given que existe um entrevistador com nome "Rian", email "rianwilker@gmail.com" e telefone "87-99946-9995" para a vaga de emprego "Dev Pleno ruby on rails"
    When seleciono o entrevistador desejado
    And acesso a pagina de edicao de entrevistador
    And altero o email do entrevistador selecionado para "rianw@gmail.com"
    And clico no botao para editar o entrevistador
    Then aparece uma mensagem de confirmacao na tela que o entrevistador foi editado com sucesso

  Scenario: Excluir um entrevistador
    Given um entrevistador com nome "Gabriel", email "Gabriel@gmail.com" e telefone "87-99945-9995" para a vaga de emprego "Dev Junior ruby on rails"
    When acesso a página de listagem de entrevistadores
    And seleciono o entrevistador desejado
    And clico no botão para excluir o entrevistador
    Then aparece uma mensagem de confirmação na tela que o entrevistador foi excluído