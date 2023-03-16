json.extract! curriculo, :id, :nome, :objetivo, :experiencia_profissional, :formacao_academica, :habilidades, :candidato_id, :created_at, :updated_at
json.url curriculo_url(curriculo, format: :json)
