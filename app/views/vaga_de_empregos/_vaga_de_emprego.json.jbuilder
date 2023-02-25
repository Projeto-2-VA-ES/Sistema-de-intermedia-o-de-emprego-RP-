json.extract! vaga_de_emprego, :id, :titulo, :descricao, :salario, :empregador_id, :created_at, :updated_at
json.url vaga_de_emprego_url(vaga_de_emprego, format: :json)
