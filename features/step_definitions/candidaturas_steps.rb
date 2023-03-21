
#Criar candidatura
Given('que existe um candidato chamado {string} com e-mail {string} com o cpf {string} com a data {string} e com o seguinte numero {string}') do |nome, email, cpf, data_nascimento, numero_telefone|
  @candidato = Candidato.create!(nome: nome, email: email, cpf: cpf, dataNascimento: Date.parse(data_nascimento), telefone: numero_telefone)
end

And('que existe um empregador chamdo {string} com a empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, empresa, email, endereco, telefone, cnpj|
  @empregador = Empregador.create!(nome: nome, nomeEmpresa: empresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end

And('criou a seguinte vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}') do |titulo, descricao, salario|
  @vaga_de_emprego = VagaDeEmprego.create!(titulo: titulo, descricao: descricao, salario: salario, empregador: @empregador)
end

When('acesso a página de candidatura da vaga de emprego') do
  visit new_candidatura_path(@candidatura)
end

And('preencho minha mensagem de candidatura com {string} e seleciono a vaga desejada') do |mensagem|
  # Recupera o candidato criado anteriormente
  candidato = Candidato.find_by(nome: "João")

  # Recupera a vaga de emprego criada anteriormente
  vaga = VagaDeEmprego.find_by(titulo: "Dev junior ruby on rails")

  # Preenche a mensagem de candidatura
  fill_in "candidatura[mensagem]", with: mensagem

  #seleciona o candidato desejado no drop down
  select candidato.nome, from: "candidatura[candidato_id]"

  # Seleciona a vaga de emprego desejada no drop down
  select vaga.titulo, from: "candidatura[vaga_de_emprego_id]"

end

And('clica no botão para criar a candidatura') do
  click_button "Create Candidatura"
end

Then('aparece uma mensagem de confirmação na tela que a candidatura foi criada') do
  page.has_content?('Candidatura was successfully created.')
end
