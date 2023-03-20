require "test_helper"

class CandidaturaTest < ActiveSupport::TestCase
  test "candidatura criada com sucesso" do
    candidatura = Candidatura.new
    candidatura.mensagem = "Tenho experiência em desenvolvimento Ruby on Rails e gostaria de me candidatar à vaga."
    candidatura.candidato_id = 1
    candidatura.vaga_de_empregos_id = 1

    assert_not candidatura.save, "Candidatura criada com sucesso."
  end

  test "candidatura criada sem mensagem" do
    candidatura = Candidatura.new
    candidatura.mensagem = ""
    candidatura.candidato_id = 1
    candidatura.vaga_de_empregos_id = 1

    assert_not candidatura.save, "Candidatura nao pode ser criada sem mensagem"
  end

  test "candidatura criada sem candidato ou vaga de emprego." do
    candidatura = Candidatura.new
    candidatura.mensagem = "Tenho experiência em desenvolvimento Ruby on Rails e gostaria de me candidatar à vaga."

    assert_not candidatura.save, "Candidatura nao pode ser criada sem candidato ou vaga de emprego"
  end
end
