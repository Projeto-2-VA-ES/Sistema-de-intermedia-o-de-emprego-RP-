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


