# Adicionar Vaga
Given("que eu esteja na pagina de criacao de vaga") do
  visit new_vaga_path
end

When("eu preencho os campos obrigatorios com os dados da vaga") do
  fill_in "Titulo", with: "Desenvolvedor Ruby"
  fill_in "Descricao", with: "Vaga para desenvolvedor Ruby"
  fill_in "Salario", with: "R$ 5.000,00"
end

And("eu clico em 'Criar Vaga'") do
  click_button "Criar Vaga"
end

Then("eu devo ser redirecionado para a pagina da vaga recentemente criada") do
  expect(page).to have_content("Vaga criada com sucesso")
end

# Visualizar Vaga
Given("que eu esteja na pagina de listagem de vagas") do
  visit vagas_path
end

When("eu clico no botao 'Visualizar' da vaga desejada") do
  click_link "Visualizar"
end

Then("eu devo ser redirecionado para a pagina da vaga selecionada") do
  expect(page).to have_content("Descricao da vaga:")
end

# Editar Vaga
Given("que eu esteja na pagina de edicao de vaga") do
  visit edit_vaga_path(@vaga)
end

When("eu altero os campos desejados da vaga") do
  fill_in "Descricao", with: "Vaga para desenvolvedor Ruby on Rails"
  click_button "Atualizar Vaga"
end

Then("eu devo ser redirecionado para a pagina atualizada da vaga") do
  expect(page).to have_content("Vaga atualizada com sucesso")
end

# Remover Vaga
Given("que eu esteja na pagina de listagem de vagas") do
  visit vagas_path
end

When("eu clico no botao 'Remover' da vaga desejada") do
  click_link "Remover"
end

Then("a vaga deve ser removida da lista de vagas") do
  expect(page).to_not have_content("Desenvolvedor Ruby")
end

# Ver Lista de Vagas
Given("que eu esteja na pagina inicial") do
  visit root_path
end

When("eu clico no botao 'Ver Vagas'") do
  click_link "Ver Vagas"
end

Then("eu devo ser redirecionado para a pagina de listagem de vagas") do
  expect(page).to have_content("Lista de vagas")
end