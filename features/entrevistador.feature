Feature: entrevistador
  As a entrevistador
  I want to agendar entrevistas com os candidatos atraves do sistema de vagas de emprego
  So that eu possa avaliar suas habilidades e qualificacoes para a posicao desejada e tomar uma decisão informada sobre a contratação.

  Scenario: criar um entrevistador
    Given que estou na pagina de cadastro de entrevistador
    Given que existe um empregador chamado "Josias da Silva" dono da empresa "Empresa LÁCTEA Doces" com o email "josias666@hotmail.com" com o endereco "Rua dos Bobos 50" com o telefone "87-99204-9895" e com o cnpj "10.935.624/0001-50"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Anos de Experiência" e Salario: "3000"
    When preencho meu cadastro de entrevistador nome: "Luiz Fellipe", email: "luiz@gmail.com", telefone: "87-99258-5522" e seleciono a vaga desejada pelo entrevistador do seguinte titulo de vaga "Dev junior ruby on rails"
    And clico no botao para salvar o entrevistador
    Then eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso

  Scenario: criar um entrevistador sem preencher todos os campos obrigatorios
    Given que estou na pagina de cadastro de entrevistador
    Given que existe um empregador chamado "Josias da Silva" dono da empresa "Empresa LÁCTEA Doces" com o email "josias666@hotmail.com" com o endereco "Rua dos Bobos 50" com o telefone "87-99204-9895" e com o cnpj "10.935.624/0001-50"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Anos de Experiência" e Salario: "3000"
    When nao preencho todos os campos obrigatorios para criação de entrevistador
    Then eu vejo uma mensagem que informa que o entrevistador nao foi criado e os motivos por tras disso

  Scenario: visualizar um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Anos de Experiência" e Salario: "3000"
    When estou na pagina de entrevistador
    And visito o entrevistador desejado
    Then devo ver o nome do entrevistador e seus dados

  Scenario: editar um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Anos de Experiência" e Salario: "3000"
    When estou na pagina de entrevistador
    And visito o entrevistador desejado
    And eu clico no link de editar entrevistador
    And preencho os campos que desejo atualizar com todos os dados validos
    And clico em Atualizar entrevistador
    Then devo ver uma mensagem de confirmacao da atualizacao do entrevistador

  Scenario: excluir um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And  tem a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Anos de Experiência" e Salario: "3000"
    When estou na pagina de entrevistador
    And visito o entrevistador desejado
    And clico em deletar entrevistador
    Then devo ver uma mensagem de confirmacao da exclusao do entrevistador