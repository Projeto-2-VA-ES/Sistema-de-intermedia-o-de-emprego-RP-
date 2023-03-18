require "test_helper"

class CandidatoTest < ActiveSupport::TestCase

  test "salvar candidato com sucesso" do
    candidato = Candidato.new
    candidato.nome = "Luiz Fellipe Barbosa"
    candidato.email = "12345678901"
    candidato.cpf = "luiz@gmail.com"
    candidato.dataNascimento = "12-02-2002"
    candidato.telefone = "87-99208-9858"

    assert candidato.save
  end

  test "salvar candidato sem nome" do
    candidato = Candidato.new
    candidato.nome = ""
    candidato.email = "luiz@gmail.com"
    candidato.cpf = "72345678901"
    candidato.dataNascimento = "12-02-2002"
    candidato.telefone = "87-99208-9858"

    assert candidato.save
  end

  test "salvar candidato sem email" do
    candidato = Candidato.new
    candidato.nome = ""
    candidato.email = "12345678901"
    candidato.cpf = "72345678901"
    candidato.dataNascimento = "12-02-2002"
    candidato.telefone = "87-99208-9858"

    assert candidato.save
  end

end
