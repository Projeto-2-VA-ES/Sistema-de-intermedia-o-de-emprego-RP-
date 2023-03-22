Feature: entrevistador
  As a entrevistador
  I want to agendar entrevistas com os candidatos atraves do sistema de vagas de emprego
  So that eu possa avaliar suas habilidades e qualificacoes para a posicao desejada e tomar uma decisão informada sobre a contratação.

  Scenario: criar um entrevistador
    Given  que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And  tem disponivel a seguinte vaga de emprego: Titulo: "Dev Pleno ruby on rails", Descricao: "Candidato experiente" e Salario: "2800"
    When eu acesso a pagina de criar um entrevistador
    And preencho os campos para criacao de entrevistador
    And clico no botao para salvar o entrevistador
    Then eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso

  Scenario: criar um entrevistador sem preencher todos os campos obrigatórios
    Given que existe um empregador chamado "Carlos An" dono da empresa "Empresa AAC" com o email "carloass@example.com" com o endereco "Rua XI" com o telefone "87-97845-9896" e com o cnpj "44.935.644/0001-00"
    And tem disponivel a seguinte vaga de emprego: Titulo: "Dev Senior ruby on rails", Descricao: "Candidato experiente" e Salario: "2800"
    When eu acesso a pagina de criar um entrevistador
    And preencho alguns campos obrigatórios para criacao de entrevistador
    And clico no botao para salvar o entrevistador
    Then eu vejo uma mensagem de erro informando que o campo obrigatório faltante deve ser preenchido

  Scenario: visualizar um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And tem disponivel a seguinte vaga de emprego: Titulo: "Dev Pleno ruby on rails", Descricao: "Candidato experiente" e Salario: "2800"
    And existe um entrevistador chamado "Victor" com o email "victor@gmail.com" e o telefone "11-12345-1234"
    And esse entrevistador esta vinculado a vaga de emprego "Dev Pleno ruby on rails"
    When eu acesso a pagina do entrevistador "Victor"
    Then eu vejo as informações do entrevistador, incluindo seu nome, email e telefone, e a vaga de emprego a que está vinculado

  Scenario: editar um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And tem disponivel a seguinte vaga de emprego: Titulo: "Dev Pleno ruby on rails", Descricao: "Candidato experiente" e Salario: "2800"
    And existe um entrevistador chamado "Victor" com o email "victor@gmail.com" e o telefone "11-12345-1234"
    And esse entrevistador esta vinculado a vaga de emprego "Dev Pleno ruby on rails"
    When eu acesso a pagina de edição do entrevistador "Victor"
    And eu edito o nome do entrevistador para "Victor Souza"
    And clico no botao para salvar as alteracoes
    Then eu vejo uma mensagem que informa que as alteracoes foram salvas com sucesso

  Scenario: excluir um entrevistador
    Given que existe um empregador chamado "Carlos" dono da empresa "Empresa AC" com o email "carlos@example.com" com o endereco "Rua X" com o telefone "87-99845-9896" e com o cnpj "44.935.624/0001-00"
    And tem disponivel a seguinte vaga de emprego: Titulo: "Dev Pleno ruby on rails", Descricao: "Candidato experiente" e Salario: "2800"
    And eu criei um entrevistador com nome "Victor", email "victor@gmail.com" e telefone "11-12345-1234" para a vaga de emprego "Dev Pleno ruby on rails"
    When eu acesso a pagina de listagem de entrevistadores
    And clico no botao para excluir o entrevistador "Victor"
    Then eu vejo uma mensagem que informa que o entrevistador foi excluido com sucesso