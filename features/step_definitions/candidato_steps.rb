Given(/^que eu estou na pagina de cadastro de candidato$/) do
  visit '/candidatos/new'
end

When(/^eu preencho os campos obrigatorios com informacoes validas$/) do
  fill_in 'Nome', :with => 'Joao'
  fill_in 'Email', :with => 'joaodasilva@gmail.com'
  fill_in 'Cpf', :with => '12345678901'
  fill_in 'Datanascimento', :with => '01/01/1990'
  fill_in 'Telefone', :with => '11-12345-1234'
end

And(/^clico em Salvar Candidato$/) do
  click_button 'Create Candidato'
end


Then(/^devo ver uma mensagem de confirmacao$/) do
  page.has_content?('Candidato cadastrado com sucesso')
end

Given(/^que estou na pagina de cadastro de candidato$/) do
  visit '/candidatos/new'
end

When(/^preencho o campo de email com um valor invalido$/) do
  fill_in 'Email', :with => 'joao'
end

Then(/^devo ver uma mensagem de erro indicando que o email é invalido$/) do
  page.has_content?('Email invalido')
end

When(/^nao preencho todos os campos obrigatorios$/) do
  fill_in 'Nome', :with => ''
  fill_in 'Email', :with => ''
  fill_in 'Cpf', :with => ''
  fill_in 'Datanascimento', :with => ''
  fill_in 'Telefone', :with => ''
end

Then(/^vejo uma mensagem de erro indicando quais campos sao obrigatorios$/) do
  page.has_content?('Nome não pode ficar em branco')
  page.has_content?('Email não pode ficar em branco')
  page.has_content?('Cpf não pode ficar em branco')
  page.has_content?('Datanascimento não pode ficar em branco')
  page.has_content?('Telefone não pode ficar em branco')
end

Given('que o candidato de nome: {string}, email: {string}, cpf: {string}, dataNascimento: {string}, telefone: {string} existe') do |nome, email, cpf, dataNascimento, telefone|
  Candidato.create!(nome: nome, email: email, cpf: cpf, dataNascimento: dataNascimento, telefone: telefone)
end

And("estou na pagina de candidatos") do
  visit '/candidatos'
end

And("visito o candidato desejado") do
  click_link("Show this candidato")
end

When("eu clico no botão de deletar candidato") do
  click_button 'Destroy this candidato'
end

Then("eu vejo uma mensagem que informa que o candidato foi excluído com sucesso") do
  page.has_content?('Candidato was successfully destroyed.')
end

