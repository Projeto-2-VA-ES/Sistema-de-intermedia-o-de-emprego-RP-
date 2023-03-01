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

When("clico no botão Deletar do candidato que desejo excluir") do |button_text|
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

#EDITAR CADASTRO
Given("que estou na página de edição de um cadastro existente") do
  candidate = Candidate.create(nome: "João da Silva", email: "joao.silva@example.com", telefone: "(11) 99999-9999")
  visit edit_candidate_path(candidate)
end

When("preencho os campos que desejo atualizar com informações válidas") do
  fill_in "Nome", with: "Maria Souza"
  fill_in "Email", with: "maria.souza@example.com"
  fill_in "Telefone", with: "(11) 88888-8888"
end

And("o cadastro deve ser atualizado no banco de dados") do
  candidate = Candidate.first
  expect(candidate.nome).to eq("Maria Souza")
  expect(candidate.email).to eq("maria.souza@example.com")
  expect(candidate.telefone).to eq("(11) 88888-8888")
end

Given("que tento acessar a página de edição de um cadastro que não existe") do
  visit edit_candidate_path(-1)
end

Then("devo ver uma mensagem de erro indicando que o cadastro não foi encontrado") do
  expect(page).to have_content "Cadastro não encontrado."
end
