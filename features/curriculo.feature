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

    #Scenario: cadastrar curriculo com dados validos e invalidos
    #  Given eu estou na pagina de cadastro de curriculo
    #  When eu preencho o formulario de cadastro de curriculo com dados validos e invalidos
    #  And eu clico em "cadastrar"
    #  Then eu vejo a mensagem "erro ao cadastrar curriculo"
    #  And eu vejo o formulario de cadastro de curriculo preenchido com os dados validos e invalidos

    Scenario: editar curriculo
      Given que o candidato de nome: "Victor Santos", email: "victor@gmail.com", cpf: "11111111176", dataNascimento: "21-01-2001", telefone: "87-99999-6666" existe
      And o curriculo de nome: "Joao", objetivo:"Trabalhar na área administrativa", experiencia_profissional:"10 anso na área", formacao_academica:"Administração", habilidades:"inglês fluente" existe
      When estou na pagina de candidatos
      And eu clico no link Curriculo
      And eu clico no link Para mostrar o curriculo
      And eu clico no link Editar
      And eu preencho o formulario de edicao de curriculo com os dados validos
      And eu clico no Botao de atualizar curriculo
      Then eu vejo a mensagem curriculo editado com sucesso

    #Scenario: deletar curriculo
    #  Given eu estou na pagina de curriculos cadastrados
    #  When eu clico em "deletar"
    #   Then eu vejo a mensagem "curriculo deletado com sucesso"
    #  And eu nao vejo o curriculo na lista de curriculos cadastrados











