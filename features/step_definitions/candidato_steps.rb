Given(/^que eu estou na pagina de cadastro de candidato$/) do
  visit '/candidatos/new'
end

When(/^eu preencho os campos obrigatorios com informacoes validas$/) do

  Candidato.create!(nome: "Joao", email: 'joaodasilva@gmail.com', cpf: '12345678901', dataNascimento: '2000-01-01', telefone: '11-12345-1234')
  Curriculo.create!(nome: "Joao", objetivo:'Trabalhar na área administrativa',experiencia_profissional:'10 anso na área',formacao_academica:'Administração',habilidades:'inglês fluente',candidato_id:1)
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
  Candidato.create!(nome: "Luiz Fellipe", email: 'lusilva@gmail.com', cpf: '12346978901', dataNascimento: '2000-01-01', telefone: '11-12345-1234')

end

Then(/^vejo uma mensagem de erro indicando quais campos sao obrigatorios$/) do
  page.has_content?('Nome não pode ficar em branco')
end

Given('que o candidato de nome: {string}, email: {string}, cpf: {string}, dataNascimento: {string}, telefone: {string} existe') do |nome, email, cpf, dataNascimento, telefone|
  Candidato.create!(nome: nome, email: email, cpf: cpf, dataNascimento: dataNascimento, telefone: telefone)
end

When("estou na pagina de candidatos") do
  visit '/candidatos'
end

And("visito o candidato desejado") do
  Candidato.last
  find_all(:link_or_button, 'Show this candidato')[1].click
end

And("eu clico no botão de deletar candidato") do
  click_button 'Destroy this candidato'
end

Then("eu vejo uma mensagem que informa que o candidato foi excluído com sucesso") do
  page.has_content?('Candidato was successfully destroyed.')
end

And(/^eu clico no link de editar candidato$/) do
  click_link_or_button 'Edit this candidato'
end

And(/^preencho os campos que desejo atualizar com informacoes validas$/) do
  fill_in 'Email', :with => 'victor@13gmail.com'
end

And(/^clico em Atualizar Candidato$/) do
  click_button 'Update Candidato'
end

Then(/^devo ver uma mensagem de confirmacao da atualizacao$/) do
  page.has_content?('Candidato atualizado com sucesso')
end