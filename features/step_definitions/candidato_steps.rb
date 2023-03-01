#CRIAR CADASTRO
Given("que estou na página de cadastro de candidato") do
  visit new_candidate_path
end

When("preencho os campos obrigatórios com informações válidas") do
  fill_in "Nome", with: "João da Silva"
  fill_in "Email", with: "joao.silva@example.com"
  fill_in "Telefone", with: "(11) 99999-9999"
end

And("clico em Salvar") do |button_text|
  click_on button_text
end

Then("devo ver uma mensagem de confirmação") do
  expect(page).to have_content "Cadastro salvo com sucesso."
end

And("meu cadastro deve ser salvo no banco de dados") do
  expect(Candidate.count).to eq(1)
end

#DELETAR CADASTRO
Given("que estou na página de listagem de candidatos") do
  visit candidates_path
end

When("clico no botão {string} do candidato que desejo excluir") do |button_text|
  candidate = Candidate.create(nome: "João da Silva", email: "joao.silva@example.com", telefone: "(11) 99999-9999")
  within "#candidate_#{candidate.id}" do
    click_on button_text
  end
end

And("confirmo a operação") do
  page.driver.browser.switch_to.alert.accept
end

Then("devo ver uma mensagem de confirmação") do
  expect(page).to have_content "Cadastro excluído com sucesso."
end

And("o cadastro deve ser excluído do banco de dados") do
  expect(Candidate.count).to eq(0)
end
