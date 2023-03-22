Feature entrevistador
  As a entrevistador
  I want to agendar entrevistas com os candidatos atraves do sistema de vagas de emprego
  So that eu possa avaliar suas habilidades e qualificacoes para a posicao desejada e tomar uma decisão informada sobre a contratação.

  Scenario: criar um entrevistador
    Given  que existe um empregador chamado "Paulo" com a empresa "Empresa ABC" com o email "paulo@example.com" com o endereco "Rua ponte" com o telefone "87-99945-9896" e com o cnpj "44.935.624/0001-76"
    And  criou a seguinte vaga de emprego: Titulo: "Dev junior ruby on rails", Descricao: "Candidato confiante" e Salario: "2500"
    When eu acesso a pagina de criar um entrevistador
    And preencho os campos para criacao de entrevistador
    And clico no botao para salvar o entrevistador
    Then eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso