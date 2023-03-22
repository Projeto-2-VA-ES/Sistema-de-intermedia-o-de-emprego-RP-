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
  empregador = Empregador.first
  visit(empregador_path(empregador))
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

#Criar vaga sem sucesso 3
Then(/^eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com a descricao e o salario em branco$/) do
  page.has_content?("Descricão e salário não podem ficar em branco")
end
#Criar vaga sem sucesso 4
Then(/^eu vejo uma mensagem que informa que a vaga nao pode ser cadastrada com salario em branco$/) do
  page.has_content?("Salário não pode ficar em branco")
end

=begin
#Editar vaga
Given('a vaga de titulo: {string}, descricao: {string}, salario: {string} existe') do |titulo, descricao, salario|
  vaga_de_empregos = VagaDeEmprego.create!(titulo: titulo_vaga, descricao: 'descricao da vaga de emprego', salario: 1000)

end

And('que eu esteja na pagina de edicao de vaga') do
  visit edit_vaga_de_empregos_path(@vaga)
end

When('altero os campos desejados da vaga, preenchendo a descricao com {string}') do |nova_descricao|
  fill_in 'vaga[descricao]', with: nova_descricao
end

And('e clico para atualizar vaga') do
click_button 'Atualizar Vaga'
end

Then('aparece a mensagem de confirmacao na tela que a vaga atualizada com sucesso') do
  page.has_content?('Vaga atualizada com sucesso!')
end

#Remover vaga
When('que eu esteja na pagina de listagem de vagas') do
  visit vaga_de_empregos_path(@vaga)
end

And('clico no botao para deletar a vaga') do
  vaga_de_empregos = VagaDeEmprego.first
  visit(vaga_de_empregos_path(vaga_de_empregos))
  click_button 'Destroy this Vaga de Emprego'
end

Then('aparece uma mensagem dizendo a vaga foi removida com sucesso') do
  page.has_content?('Vaga removida com sucesso!')
end
=end
