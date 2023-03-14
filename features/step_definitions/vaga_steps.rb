#Criar vaga com sucesso
Given(/^que eu esteja na pagina de criacao de vaga$/) do
  visit '/vaga_de_empregos/new'
end

When("eu preencho os campos obrigatorios com os dados da vaga titulo: {string}, descricao: {string}, salario: {string}") do |titulo, descricao, salario|
  fill_in 'Titulo', with: titulo
  fill_in 'Descricao', with: descricao
  fill_in 'Salario', with: salario
end

And(/^eu clico em 'Criar Vaga'$/) do
  click_on 'Create Vaga de emprego'
end

Then(/^eu devo ser redirecionado para a pagina da vaga recem-criada e vejo a mensagem "([^"]*)"$/) do |mensagem|
  expect(page).to have_content(mensagem)
end

#Criar vaga sem sucesso
Then(/^eu vejo uma mensagem que informa que a vaga não pode ser cadastrada com essa descricao$/) do
  expect(page).to have_content("Descricão não pode ficar em branco")
end

# Visualizar vaga
Given("a vaga de titulo: {string}, descricao: {string}, salario: {string} existe") do |titulo, descricao, salario|
  visit '/vaga_de_empregos/new'
  fill_in 'Titulo', with: titulo
  fill_in 'Descricao', with: descricao
  fill_in 'Salario', with: salario
end

And(/^que eu esteja na pagina de listagem de vagas$/) do
  visit '/vaga_de_empregos'
end

When("eu clico no botao 'Visualizar' da vaga com titulo: {string}, descricao: {string}, salario: {string}") do |titulo, descricao, salario|
  vaga = Vaga.find_by(titulo: titulo, descricao: descricao, salario: salario)
  find("a[href='/vagas/#{vaga.id}']").click
end

Then(/^eu devo ser redirecionado para a pagina da vaga selecionada e vejo a mensagem "([^"]*)"$/) do |mensagem|
  expect(page).to have_content(mensagem)
end

# Editar vaga
And(/^que eu esteja na pagina de edicao de vaga$/) do
  vaga = Vaga.last
  visit "/vagas/#{vaga.id}/edit"
end

When(/^eu altero os campos desejados da vaga, preenchendo a descricao com "([^"]*)" e clico em 'Atualizar Vaga'$/) do |nova_descricao|
  fill_in 'Descricao', with: nova_descricao
  click_on 'Atualizar Vaga'
end

Then(/^eu devo ser redirecionado para a pagina atualizada da vaga e vejo a mensagem "([^"]*)"$/) do |mensagem|
  expect(page).to have_content(mensagem)
end

# Remover vaga
When("eu clico no botao 'Remover' da vaga com titulo: {string}, descricao: {string}, salario: {string}") do |titulo, descricao, salario|
  vaga = Vaga.find_by(titulo: titulo, descricao: descricao, salario: salario)
  find("a[href='/vagas/#{vaga.id}'][data-method='delete']").click
end

Then("eu devo ser redirecionado para a pagina atualizada da vaga e vejo uma mensagem dizendo {string}") do |mensagem|
  expect(page).to have_content(mensagem)
end
