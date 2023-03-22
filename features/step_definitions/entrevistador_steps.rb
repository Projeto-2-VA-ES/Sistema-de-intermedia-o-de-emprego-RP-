
Given('que existe um empregador chamado {string} com a empresa {string} com o email {string} com o endereco {string} com o telefone {string} e com o cnpj {string}') do |nome, empresa, email, endereco, telefone, cnpj|
  @empregador = Empregador.create!(nome: nome, nomeEmpresa: empresa, email: email, endereco: endereco, telefone: telefone, cnpj: cnpj)
end

And('criou a seguinte vaga de emprego: Titulo: {string}, Descricao: {string} e Salario: {string}') do |titulo, descricao, salario|
  @vaga_de_emprego = VagaDeEmprego.create!(titulo: titulo, descricao: descricao, salario: salario, empregador: @empregador)
end

And('eu acesso a pagina de criar um entrevistador') do
  visit '/entrevistadors/new'
end

And('preencho os campos para criacao de entrevistador') do
  Entrevistador.create!(nome: "Victor", email: 'victor@gmail.com', telefone: '11-12345-1234')
  vaga = VagaDeEmprego.find_by(titulo: "Dev junior ruby on rails")
  select vaga.titulo, from: "entrevistador[vaga_de_emprego_id]"
end

And('clico no botao para salvar o entrevistador') do
  click_button 'Create Entrevistador'
end

Then('eu vejo uma mensagem que informa que o entrevistador foi criado com sucesso') do
  page.has_content?('Entrevistador cadastrado com sucesso')
end
