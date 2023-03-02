# Adicionar Vaga
Given("que eu esteja na página de criação de vaga") do
  visit new_vaga_path
end

When("eu preencho os campos obrigatórios com os dados da vaga") do
  fill_in "Título", with: "Desenvolvedor Ruby"
  fill_in "Descrição", with: "Vaga para desenvolvedor Ruby"
  fill_in "Salário", with: "R$ 5.000,00"
end

And("eu clico em 'Criar Vaga'") do
  click_button "Criar Vaga"
end

Then("eu devo ser redirecionado para a página da vaga recém-criada") do
  expect(page).to have_content("Vaga criada com sucesso")
end


# Visualizar Vaga
Given("que eu esteja na página de listagem de vagas") do
  visit vagas_path
end

When("eu clico no botão 'Visualizar' da vaga desejada") do
  click_link "Visualizar"
end

Then("eu devo ser redirecionado para a página da vaga selecionada") do
  expect(page).to have_content("Descrição da vaga:")
end

# Editar Vaga
Given("que eu esteja na página de edição de vaga") do
  visit edit_vaga_path(@vaga)
end

When("eu altero os campos desejados da vaga") do
  fill_in "Descrição", with: "Vaga para desenvolvedor Ruby on Rails"
  click_button "Atualizar Vaga"
end

Then("eu devo ser redirecionado para a página atualizada da vaga") do
  expect(page).to have_content("Vaga atualizada com sucesso")
end


# Remover Vaga
Given("que eu esteja na página de listagem de vagas") do
  visit vagas_path
end

When("eu clico no botão 'Remover' da vaga desejada") do
  click_link "Remover"
end

Then("a vaga deve ser removida da lista de vagas") do
  expect(page).to_not have_content("Desenvolvedor Ruby")
end


# Ver Lista de Vagas
Given("que eu esteja na página inicial") do
  visit root_path
end

When("eu clico no botão 'Ver Vagas'") do
  click_link "Ver Vagas"
end

Then("eu devo ser redirecionado para a página de listagem de vagas") do
  expect(page).to have_content("Lista de vagas")
end
