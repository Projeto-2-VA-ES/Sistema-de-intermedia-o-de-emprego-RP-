Given('que estou na pagina de cadastro de entrevistador') do
  visit '/entrevistadors/new'
end

Given('que existe um empregador chamado {string} dono da empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, nomeEmpresa, email, endereco, telefone, cnpj|
  Empregador.create!(nome: nome, nomeEmpresa: nomeEmpresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end

And('tem a seguinte vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}') do |titulo, descricao, salario|
  VagaDeEmprego.create!(titulo: titulo, descricao: descricao, salario: salario, empregador: Empregador.first)
end

When('preencho meu cadastro de entrevistador nome: {string}, email: {string}, telefone: {string} e seleciono a vaga desejada pelo entrevistador do seguinte titulo de vaga {string}') do |nome, email, telefone, titulo|

  @entrevistador = Entrevistador.create!(nome: nome, email: email, telefone: telefone, vaga_de_emprego: VagaDeEmprego.first)

  # Recupera a vaga de emprego criada anteriormente
  VagaDeEmprego.find_by(titulo: titulo)

end

And('clico no botao para salvar o entrevistador') do
  click_button 'Create Entrevistador'
end

Then('eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso') do
  page.has_content?('Entrevistador cadastrado com sucesso')
end

When(/^nao preencho todos os campos obrigatorios para criação de entrevistador$/) do
  fill_in 'Email', :with => 'luiz'
end

Then(/^eu vejo uma mensagem que informa que o entrevistador nao foi criado e os motivos por tras disso$/) do
  page.has_content?('Email invalido')
end

When(/^estou na pagina de entrevistador$/) do
  visit '/entrevistadors'
end

And(/^visito o entrevistador desejado$/) do
  entrevistador = Entrevistador.last
  visit entrevistadors_path(entrevistador)
end

And(/^eu clico no link de editar entrevistador$/) do
  click_link 'Edit this entrevistador'
end

And(/^preencho os campos que desejo atualizar com todos os dados validos$/) do
  fill_in 'Nome', :with => 'Karlos'
end

And(/^clico em Atualizar entrevistador$/) do
  click_button 'Update Entrevistador'
end

Then(/^devo ver uma mensagem de confirmacao da atualizacao do entrevistador$/) do
  page.has_content?('Entrevistador atualizado com sucesso')
end

And(/^clico em deletar entrevistador$/) do
  click_button 'Destroy this entrevistador'
end

Then(/^devo ver uma mensagem de confirmacao da exclusao do entrevistador$/) do
  page.has_content?('Entrevistador was successfully destroyed.')
end

Then(/^devo ver o nome do entrevistador e seus dados$/) do
  page.has_content?('Karlos')
end





#Deletar entrevistador

# Given que existe um entrevistador com nome "Rian", email "rianwilker@gmail.com" e telefone "87-99946-9995" para a vaga de emprego "Dev Pleno ruby on rails"
Given("que existe um entrevistador com nome {string}, email {string} e telefone {string} para a vaga de emprego {string}") do |nome, email, telefone, titulo_vaga|
  @empregador = Empregador.create!(nome: "Pablo", nomeEmpresa: "Empresa ABCD", email: "Pablo@example.com", endereco: "Rua A", telefone: "87-95562-9995", cnpj: "44.935.654/0001-30")

  # Cria a vaga de emprego
  vaga_de_emprego = VagaDeEmprego.create!(titulo: titulo_vaga, descricao: 'descricao da vaga de emprego', salario: 1000, empregador: @empregador)

  # Criar entrevistador
  @entrevistador = Entrevistador.create!(nome: nome, email: email, telefone: telefone, vaga_de_emprego_id: vaga_de_emprego.id)
end

# When acesso a página de listagem de entrevistadores
When("acesso a página de listagem de entrevistadores") do
  visit entrevistadors_path
end
And("seleciono o entrevistador desejado") do
  entrevistador = Entrevistador.first
  visit(entrevistador_path(entrevistador))
end

# And clico no botão para excluir o entrevistador
And("clico no botão para excluir o entrevistador") do
  click_button "Destroy this entrevistador"
end

# Then aparece uma mensagem de confirmação na tela que o entrevistador foi excluído
Then("aparece uma mensagem de confirmação na tela que o entrevistador foi excluído") do
  page.has_content?("Entrevistador was successfully destroyed.")
end

#Editar Entrevistador
#
And('acesso a pagina de edicao de entrevistador')do
  visit edit_entrevistador_path(@entrevistador)
end
And('altero o email do entrevistador selecionado para {string}') do |email|
  fill_in "entrevistador[email]", with: email
end

And('clico no botao para editar o entrevistador') do
  click_button "Update Entrevistador"
end

Then('aparece uma mensagem de confirmacao na tela que o entrevistador foi editado com sucesso') do
  page.has_content?("Entrevistador was successfully updated.")
end