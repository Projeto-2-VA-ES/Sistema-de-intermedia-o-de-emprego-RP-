json.extract! candidatura, :id, :mensagem, :candidato_id, :vaga_de_emprego_id, :created_at, :updated_at
json.url candidatura_url(candidatura, format: :json)
