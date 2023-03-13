# Criar vaga com sucesso
Given('que exista uma vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  Vaga.create!(titulo: titulo, descricao: descricao, salario: salario)
end

And('eu visito a pagina de criacao de vaga') do
  visit new_vaga_path
end

When('eu crio a vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  fill_in 'Titulo', :with => titulo
  fill_in 'Descricao', :with => descricao
  fill_in 'Salario', :with => salario
  click_button 'Criar Vaga'
end

Then('eu vejo uma mensagem que informa que a vaga foi criada com sucesso') do
  page.has_content?('Vaga criada com sucesso.')
end


# Criar vaga sem sucesso

When('Preencho os campos de cadastro da vaga com os seguintes dados: titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  fill_in 'Titulo', :with => titulo
  fill_in 'Descricao', :with => descricao
  fill_in 'Salario', :with => salario
end

Then('eu vejo uma mensagem que informa que a vaga não pode ser cadastrada com esse titulo') do
  page.has_content?('Este título não pode ser cadastrado')
end


# Visualizar Vaga
Given('que exista uma vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  Vaga.create!(titulo: titulo, descricao: descricao, salario: salario)
end

Given("que eu esteja na pagina de listagem de vagas") do
  visit vagas_path
end

When("eu clico no botao 'Visualizar' da vaga desejada") do
  click_link "Visualizar"
end

Then("eu devo ser redirecionado para a pagina da vaga selecionada") do
  expect(page).to have_content("Descricao da vaga:")
end


# Editar vaga com sucesso
Given('que exista uma vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  Vaga.create!(titulo: titulo, descricao: descricao, salario: salario)
end

And("que eu esteja na pagina de edicao de vaga") do
  visit edit_vaga_path(@vaga)
end

When('eu altero os campos desejados da vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  fill_in "Descricao", with: "Vaga para desenvolvedor Ruby on Rails"
  click_button "Atualizar Vaga"
end

Then("eu devo ser redirecionado para a pagina atualizada da vaga") do
  expect(page).to have_content("Vaga atualizada com sucesso")
end


# Remover vaga com sucesso
Given('que exista uma vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|
  Vaga.create!(titulo: titulo, descricao: descricao, salario: salario)
end

And("que eu esteja na pagina de vagas") do
  visit vagas_path
end

When("eu clico no botao de remover da vaga com titulo: {string}, descricao: {string}, salario: {string}') do |titulo, descricao, salario|") do
  click_link "Remover"
end

Then('eu vejo uma mensagem que informa que a vaga foi excluída com sucesso') do
  page.has_content?('Vaga excluída com sucesso.')
end

