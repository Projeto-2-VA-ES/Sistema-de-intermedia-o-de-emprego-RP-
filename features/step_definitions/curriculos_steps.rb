And('o curriculo de nome: {string}, objetivo:{string}, experiencia_profissional:{string}, formacao_academica:{string}, habilidades:{string} existe') do |nome, objetivo, experiencia_profissional, formacao_academica, habilidades|
  Curriculo.create!(nome: nome, objetivo: objetivo, experiencia_profissional: experiencia_profissional, formacao_academica: formacao_academica, habilidades: habilidades, candidato_id: 1)
end

And(/^eu clico no link Curriculo$/) do
  visit '/candidatos'
  candidato = Candidato.last
  visit candidato_path(candidato)
  click_link 'Currículo'
end

And(/^eu clico no link Para mostrar o curriculo$/) do
  click_link 'Show this curriculo'
end

And(/^eu clico no link Editar$/) do
  click_link 'Edit this curriculo'
end

And(/^eu preencho o formulario de edicao de curriculo com os dados validos$/) do
  fill_in 'Nome', :with => 'Joao'
  fill_in 'Objetivo', :with => 'Trabalhar na área administrativa'
  fill_in 'Experiencia profissional', :with => '10 anso na área'
  fill_in 'Formacao academica', :with => 'Administração'
  fill_in 'Habilidades', :with => 'inglês fluente'
  fill_in 'Candidato', :with => '1'
end

And(/^eu clico no Botao de atualizar curriculo$/) do
  click_button 'Update Curriculo'
end

Then(/^eu vejo a mensagem curriculo editado com sucesso$/) do
  page.has_content?('Curriculo was successfully updated.')
end

And(/^eu clico em deletar$/) do
  click_button 'Destroy this curriculo'
end

Then(/^eu vejo a mensagem curriculo deletado com sucesso$/) do
  page.has_content?('Curriculo was successfully destroyed.')
end

Then(/^devo ver uma mensagem de erro indicando que o email é invalido e que o curriculo nao foi cadastrado$/) do
  page.has_content?('Email is invalid')
  page.has_content?('Curriculo was not created')
end

When(/^eu preencho os campos obrigatorios de candidato e curriculo com informacoes validas$/) do
  Candidato.create!(nome: "Joao", email: 'joa@gmail.com', cpf: '12345678972', dataNascimento: '2000-01-01', telefone: '11-12345-1234')
  Curriculo.create!(nome: "Joao", objetivo:'Trabalhar na área administrativa',experiencia_profissional:'10 anso na área',formacao_academica:'Administração',habilidades:'inglês fluente',candidato_id:1)
end

And(/^eu preencho os campos obrigatorios de candidato e curriculo com informacoes validas e invalidas$/) do
  Candidato.create!(nome: "Joao", email: 'joa@.com', cpf: '5678972', dataNascimento: '2000-01-01', telefone: '11123451234')
  Curriculo.create!(nome: "Joao", objetivo:'Trabalhar na área administrativa',experiencia_profissional:'10 anso na área',formacao_academica:'Administração',habilidades:'inglês fluente',candidato_id:1)
end