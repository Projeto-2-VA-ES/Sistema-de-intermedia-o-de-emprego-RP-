Feature: gerenciar curriculo
  As a candidato
  I want to cadastrar meu curriculo no site de emprego
  So that eu possa me candidatar a uma vaga de emprego

    Scenario: cadastrar curriculo
      Given que eu estou na pagina de cadastro de candidato
      When eu preencho os campos obrigatorios com informacoes validas
      And clico em Salvar Candidato
      Then devo ver uma mensagem de confirmacao

    Scenario: cadastrar curriculo com dados invalidos
      Given que estou na pagina de cadastro de candidato
      When preencho o campo de email com um valor invalido
      And clico em Salvar Candidato
      Then devo ver uma mensagem de erro indicando que o email é invalido

    Scenario: cadastrar curriculo com dados validos e invalidos
        Given que estou na pagina de cadastro de candidato
        When preencho o campo de email com um valor invalido
        And  eu preencho os campos obrigatorios com informacoes validas
        And clico em Salvar Candidato
        Then devo ver uma mensagem de erro indicando que o email é invalido e que o curriculo nao foi cadastrado


    Scenario: editar curriculo
      Given que o candidato de nome: "Luiz Fellipe", email: "luiz@gmail.com", cpf: "06725779417", dataNascimento: "12-02-2002", telefone: "87-99208-9858" existe
      And o curriculo de nome: "Joao", objetivo:"Trabalhar na área administrativa", experiencia_profissional:"10 anso na área", formacao_academica:"Administração", habilidades:"inglês fluente" existe
      When estou na pagina de candidatos
      And eu clico no link Curriculo
      And eu clico no link Para mostrar o curriculo
      And eu clico no link Editar
      And eu preencho o formulario de edicao de curriculo com os dados validos
      And eu clico no Botao de atualizar curriculo
      Then eu vejo a mensagem curriculo editado com sucesso

    Scenario: deletar curriculo
      Given que o candidato de nome: "Luiz Fellipe", email: "luiz@gmail.com", cpf: "06725779417", dataNascimento: "12-02-2002", telefone: "87-99208-9858" existe
      And o curriculo de nome: "Joao", objetivo:"Trabalhar na área administrativa", experiencia_profissional:"10 anso na área", formacao_academica:"Administração", habilidades:"inglês fluente" existe
      When estou na pagina de candidatos
      And eu clico no link Curriculo
      And eu clico no link Para mostrar o curriculo
      And eu clico em deletar
      Then eu vejo a mensagem curriculo deletado com sucesso












