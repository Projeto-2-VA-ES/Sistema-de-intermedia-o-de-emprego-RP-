json.extract! candidato, :id, :nome, :email, :cpf, :dataNascimento, :telefone, :created_at, :updated_at
json.url candidato_url(candidato, format: :json)
