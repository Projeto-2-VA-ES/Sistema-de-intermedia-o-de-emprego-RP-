# Criar vaga
Given('O empregador de nomeEmpresa: {string}, nome: {string}, endereco: {string}, email: {string}, cnpj: {string}, telefone: {string} existe') do |nomeEmpresa, nome, endereco, email, cnpj, telefone|

  visit '/empregadors/new'
  fill_in 'Nomeempresa', with: nomeEmpresa
  fill_in 'Nome', with: nome
  fill_in 'Endereco', with: endereco
  fill_in 'Email', with: email
  fill_in 'Cnpj', with: cnpj
  fill_in 'Telefone', with: telefone
  click_button 'Create Empregador'
end
And(/^que eu esteja na pagina de criacao de vaga$/) do
  visit'/vaga_de_empregos/new'
end
When("eu preencho os campos obrigatorios com os dados da vaga titulo: {string}, descricao: {string}, salario: {string}") do |titulo, descricao, salario|
  fill_in 'Titulo', with: titulo
  fill_in 'Descricao', with: descricao
  fill_in 'Salario', with: salario
end
And(/^eu clico em criar Vaga$/) do
  click_on 'Create Vaga de emprego'
end
Then(/^eu devo ser redirecionado para a pagina da vaga recem-criada e vejo a mensagem "([^"]*)"$/) do |mensagem|
  page.has_content?(mensagem)
end
#Criar vaga sem sucesso 1
Then(/^eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com essa descricao$/) do
  page.has_content?("Descricão não pode ficar em branco")
end
#Criar vaga sem sucesso 2
Then(/^eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com esse titulo$/) do
  page.has_content?("Título não pode ficar em branco")
end

# Remover vaga
Given('que existe uma vaga de titulo: {string}, descricao: {string}, salario: {string} para o empregador {string}') do |titulo, descricao, salario, nome_empregador|
  visit '/empregadors/new'
  fill_in 'Nomeempresa', with: "nomeEmpresa"
  fill_in 'Nome', with: nome_empregador
  fill_in 'Endereco', with: "Rua luan, 47"
  fill_in 'Email', with: "luan@example.com"
  fill_in 'Cnpj', with: "12.345.678/0001-90"
  fill_in 'Telefone', with: "11-95555-5555"
  click_button 'Create Empregador'

  visit '/vaga_de_empregos/new'
  fill_in 'Titulo', with: titulo
  fill_in 'Descricao', with: descricao
  fill_in 'Salario', with: salario
  click_button 'Create Vaga de emprego'
  expect(page).to have_content(titulo)
end

And('eu estou na pagina de listagem de vagas') do
  visit "/vaga_de_empregos"
end

When('eu acesso uma vaga em especifico') do
  click_link_or_button 'Show this vaga de emprego'
end

And("eu clico no botao para deletar a vaga") do
  click_link_or_button 'Destroy this vaga de emprego'
end

Then("eu vejo a mensagem que diz que a vaga foi removida com sucesso") do
  expect(page).to have_content('Vaga de emprego foi destruida com sucesso.')
end

#Editar vaga
And('eu acesso a pagina de edicao desta vaga') do
  click_link_or_button 'Edit this vaga de emprego'
end

And('eu altero os campos desejados da vaga preenchendo a descricao com {string}') do |descricao|
  fill_in 'Descricao', with: descricao
end

And('clico para atualizar vaga') do
  click_link_or_button 'Update Vaga de emprego'
end

Then('aparece a mensagem de confirmacao na tela que a vaga atualizada com sucesso') do
  expect(page).to have_content('Vaga de emprego foi atualizada com sucesso.')
  expect(page).to have_content('Vaga para desenvolvedor Ruby on Rails')
end


