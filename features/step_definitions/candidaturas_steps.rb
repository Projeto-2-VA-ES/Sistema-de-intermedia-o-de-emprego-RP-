
#Criar candidatura
Given('que existe um candidato chamado {string} com e-mail {string} com o cpf {string} com a data {string} e com o seguinte numero {string}') do |nome, email, cpf, data_nascimento, numero_telefone|
  @candidato = Candidato.create!(nome: nome, email: email, cpf: cpf, dataNascimento: Date.parse(data_nascimento), telefone: numero_telefone)
end

And('que existe um empregador chamado {string} com a empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, empresa, email, endereco, telefone, cnpj|
  @empregador = Empregador.create!(nome: nome, nomeEmpresa: empresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end

And('criou a seguinte vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}') do |titulo_vaga, descricao, salario|
  VagaDeEmprego.create!(titulo_vaga: titulo, descricao: descricao, salario: salario, empregador: @empregador)
end

When('acesso a pagina de candidatura da vaga de emprego') do
  visit new_candidatura_path(@candidatura)
end

And('preencho minha mensagem de candidatura com {string} e seleciono a vaga desejada para o candidato {string}') do |mensagem, nome|
  # Recupera o candidato criado anteriormente
  candidato = Candidato.find_by(nome: nome)

  # Recupera a vaga de emprego criada anteriormente
  vaga = VagaDeEmprego.find_by(titulo: "Dev junior ruby on rails")

  # Preenche a mensagem de candidatura
  fill_in "candidatura[mensagem]", with: mensagem

  #seleciona o candidato desejado no drop down
  select candidato.nome, from: "candidatura[candidato_id]"

  # Seleciona a vaga de emprego desejada no drop down
  select vaga.titulo, from: "candidatura[vaga_de_emprego_id]"

end

And('clica no botao para criar a candidatura') do
  click_button "Create Candidatura"
end

Then('aparece uma mensagem de confirmacao na tela que a candidatura foi criada') do
  page.has_content?('Failed to create Candidatura.')
end

#criar candidatura com informacoes invalidas
Then('aparece uma mensagem de confirmacao na tela que a candidatura nao pode ser criada com a mensagem em branco') do
  page.has_content?('')
end


#deletar uma candidatura

Given('que existe uma candidatura para a vaga {string} feita pelo candidato {string}') do |titulo_vaga, nome_candidato|
  # Cria o candidato

  candidato = Candidato.create!(nome: nome_candidato, email: 'joao666@gmail.com', cpf: '66655545698', dataNascimento: Time.zone.today, telefone: '87-99955-6622')


  @empregador = Empregador.create!(nome: "Paulo", nomeEmpresa: "Empresa ABC", email: "paulo50@example.com", endereco: "Rua A", telefone: "87-95562-9995", cnpj: "44.935.624/0001-40")

  # Cria a vaga de emprego
  vaga_de_emprego = VagaDeEmprego.create!(titulo: titulo_vaga, descricao: 'descricao da vaga de emprego', salario: 1000, empregador: @empregador)


  # Cria a candidatura
  @candidatura = Candidatura.create!(mensagem: "Tenho interesse na vaga de #{titulo_vaga}", candidato_id: candidato.id, vaga_de_emprego_id: vaga_de_emprego.id)

end

When('acesso a pagina de listagem de candidaturas') do
  visit candidaturas_path
end

And('clico no botao para deletar a candidatura') do
  candidatura = Candidatura.first
  visit(candidatura_path(candidatura))
  click_button("Destroy this candidatura")
end

Then('aparece uma mensagem de confirmacao na tela que a candidatura foi deletada') do
  page.has_content?('Candidatura was successfully destroyed.')
end

#Editar uma candidatura
#
Given('que existe uma candidatura para a vaga {string} feita pelo candidato {string} e empregador {string}')do |titulo_vaga, nome_candidato, nome_empregador|
  # Cria o candidato

  candidato = Candidato.create!(nome: nome_candidato, email: 'joao666@gmail.com', cpf: '66655545698', dataNascimento: Time.zone.today, telefone: '87-99955-6622')


  @empregador = Empregador.create!(nome: nome_empregador, nomeEmpresa: "Empresa ABC", email: "paulo50@example.com", endereco: "Rua A", telefone: "87-95562-9995", cnpj: "44.935.624/0001-40")

  # Cria a vaga de emprego
  vaga_de_emprego = VagaDeEmprego.create!(titulo: titulo_vaga, descricao: 'descricao da vaga de emprego', salario: 1000, empregador: @empregador)


  # Cria a candidatura
  @candidatura = Candidatura.create!(mensagem: "Tenho interesse na vaga de #{titulo_vaga}", candidato_id: candidato.id, vaga_de_emprego_id: vaga_de_emprego.id)

end

And('a mensagem de candidatura eh {string}') do |mensagem_candidatura|
  @candidatura.update!(mensagem: mensagem_candidatura)
end

When('acesso a pagina de edicao de candidaturas') do
  visit edit_candidatura_path(@candidatura)
end

And('altero a mensagem de candidatura para {string}') do |nova_mensagem|
  fill_in 'candidatura[mensagem]', with: nova_mensagem
end

And('clico no botao para salvar a edicao') do
  click_button 'Update Candidatura'
end

Then('aparece uma mensagem de confirmacao na tela que a candidatura foi editada com sucesso') do
  page.has_content?('Candidatura was successfully updated.')
end