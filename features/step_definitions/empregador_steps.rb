# frozen_string_literal: true

#Criar cadastro Empregador
Given('que eu estou na página de criação de empregador') do
  visit new_empregador_path
end

When('preencho os campos de informações do empregador') do
  fill_in 'Nome', with: 'Maria Silva'
  fill_in 'NomeEmpresa', with: 'Empresa XYZ '
  fill_in 'email', with: 'maria.silva@example.com'
  fill_in 'endereco', with: 'Rua A, 123 '
  fill_in 'telefone', with: '(11) 5555-5555 '
  fill_in 'CNPJ', with: '12.345.678/0001-00'
end
And(/^Clico em "([^"]*)"$/) do |button_text|
  click_on button_text
end


Then("eu vejo uma mensagem que informa que o empregador foi criado com sucesso") do
  expect(page).to have_content "Cadastro salvo com sucesso."
end

#Editar Empregador

Given('que eu estou na página de edição do empregador com nome "Maria Silva"') do
  visit empregador_path
end

When("preencho os campos que desejo atualizar") do
  fill_in 'NomeEmpresa', with: 'Empresa POO '
  fill_in 'email', with: 'maria.silva0203@example.com'

end

Then("eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso") do
expect(page).to have_content "Editado com sucesso."
end

#Excluir Empregador

Given('que eu tenho o empregador "Maria Silva" na lista de empregadores') do
  visit empregador_path
end
When('eu clico no botão de excluir do empregador "Maria Silva"')do |button_text|
  empregador = Empregador.create(nome: "Maria Silva", nomeEmpresa: "Empresa XYZ", email: "maria.silva@example.com", endereco: "Rua A, 123", telefone: "(11) 5555-5555", CNPJ: "12.345.678/0001-00")
  within "#empregador_#{empregador.id}" do
    click_on button_text
  end
end

Then("eu vejo uma mensagem que informa que o empregador foi excluído com sucesso") do
  expect(page).to have_content "Excluído com sucesso"
end

And("o Cadastro sera excluído") do
  expect(Empregador.count).to eq(0)
end


#Visualizar o empregador

When('eu clico no link de detalhes do empregador "Maria Silva"') do
  visit candidates_path

end

Then('eu vejo os seguintes detalhes do empregador') do |detalhes_empregador|
    detalhes_empregador.hashes.each do |detalhe|
    expect(page).to have_content(detalhe["Nome"])
    expect(page).to have_content(detalhe["NomeEmpresa"])
    expect(page).to have_content(detalhe["Email"])
    expect(page).to have_content(detalhe["Endereco"])
    expect(page).to have_content(detalhe["Telefone"])
    expect(page).to have_content(detalhe["CNPJ"])
  end
end


#Visualizar todos os empregadores

Given("que eu tenho os seguintes empregadores na base de dados") do |table|
  table.hashes.each do |empregador|
    nomeempregador = empregador[(nome)]
    empresaempreador = empregador[(nomeEmpresa)]
    emailempregador = empregador[(email)]
    enderecoempregador = empregador[(endereco)]
    telefoneempregador = empregador[(telefone)]
    cnpjempregador = empregador[(cpnj)]

  end
end

