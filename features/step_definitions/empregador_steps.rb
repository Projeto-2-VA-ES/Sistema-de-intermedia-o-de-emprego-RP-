Given('Que existe um empregador com o nome {string}, nomeEmpresa {string}, email {string}, endereco {string}, telefone {integer} e cnpj {string}') do   |nome, nomeEmpresa, email, endereco, telefone, cnpj|
  visit '/empregadors/new'
  fill_in 'empregador[nome]', :with => nome
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
  fill_in 'empregador[email]', :with => email
  fill_in 'empregador[endereco]', :with => endereco
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[cnpj]', :with => cnpj
  click_button 'Create Empregador'
  visit '/empregadors'
end


Then(/^eu vejo uma mensagem que informa que o empregador foi criado com sucesso$/) do
  pending
end

And(/^encho o campo "([^"]*)" com "([^"]*)"$/) do |arg1, arg2|
  pending
end

Given(/^que eu estou na página de criação de empregador$/) do
  pending
end

And(/^preencho o campo "([^"]*)" com "([^"]*)"$/) do |arg1, arg2|
  pending
end

When(/^eu clico em "([^"]*)"$/) do |arg|
  pending
end

Given(/^que eu estou na página de edição do empregador com nome "([^"]*)"$/) do |arg|
  pending
end

And(/^atualizo o campo "([^"]*)" com "([^"]*)"$/) do |arg1, arg2|
  pending
end

Then(/^eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso$/) do
  pending
end

Given(/^que eu tenho o empregador "([^"]*)" na lista de empregadores$/) do |arg|
  pending
end

When(/^eu clico no botão de excluir do empregador "([^"]*)"$/) do |arg|
  pending
end

And(/^confirmo a exclusão do empregador$/) do
  pending
end

Then(/^eu vejo uma mensagem que informa que o empregador foi excluído com sucesso$/) do
  pending
end

When(/^eu clico no link de detalhes do empregador "([^"]*)"$/) do |arg|
  pending
end

Then(/^eu vejo os seguintes detalhes do empregador:$/) do |table|
  # table is a table.hashes.keys # => [:Nome, :Maria Silva]
  pending
end

Given(/^que eu tenho os seguintes empregadores na base de dados:$/) do |table|
  # table is a table.hashes.keys # => [:Nome, :Nome da Empresa, :Email, :Endereço, :Telefone, :CNPJ]
  pending
end