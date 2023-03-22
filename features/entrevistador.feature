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