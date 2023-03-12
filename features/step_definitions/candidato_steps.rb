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

Given(/^que estou na pagina de listagem de candidatos$/) do
  visit '/candidatos'
end

When(/^clico no botao Deletar Candidato$/) do
  click_button 'Deletar Candidato'
end

And(/^confirmo a operacao$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^vejo uma mensagem de confirmacao$/) do
  page.has_content?('Candidato excluido com sucesso')
end

Given(/^que estou na pagina de edicao de um cadastro existente$/) do
  visit '/candidatos/'
end

When(/^preencho os campos que desejo atualizar com informacoes validas$/) do
  fill_in 'Email', :with => 'joaovdasilva@gmail.com'
end

Then(/^devo ver uma mensagem de confirmacao da atualizacao$/) do
  page.has_content?('Candidato atualizado com sucesso')
end