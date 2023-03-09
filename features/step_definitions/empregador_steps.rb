#Criar empregador

Given('O empregador de nome: {string}, nomeEmpresa: {string}, email: {string}, endereco: {string}, telefone: {string}, cnpj: {string} existe') do |nome , nomeEmpresa, email, endereco, telefone, cnpj|
  visit '/empregador/new'
  fill_in 'empregador[nome]', :with => nome
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
  fill_in 'empregador[email]', :with => email
  fill_in 'empregador[endereco]', :with => endereco
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[telefone]', :with => telefone
  fill_in 'empregador[cpnj]', :with => cnpj
  click_button 'Create Empregador'
  visit '/empregadors'
end

And("estou na pagina do empregador com nome {string}") do |nome|
  visit "/empregadors/#{Empregador.find_by_nome(nome).id}"
end

When('eu clico em criar Empregador') do
  click_button 'Create Empregador'

end

Then('eu vejo uma mensagem que informa que o paciente foi criado com sucesso')do
  page.has_content?('Empregador was successfully created.')
end

#Editar empregador

When('preencho os campos que desejo atualizar: email: {string}, nomeEmpresa: {string}')do |email, nomeEmpresa|
  fill_in 'empregador[nomeEmpresa]', :with => nomeEmpresa
  fill_in 'empregador[email]', :with => email
end
And('Clico em "Editar Empregador"')do
  click_button 'Edit Empregador'
end
Then('eu vejo uma mensagem que informa que o empregador foi atualizado com sucesso')do
  page.has_content?('Empregador was successfully edited.')
end


