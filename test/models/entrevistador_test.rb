require "test_helper"

class EntrevistadorTest < ActiveSupport::TestCase
  test "criacao de entrevistador com atributos validos" do
    entrevistador = Entrevistador.new
    entrevistador.nome = "Super Mario Bros"
    entrevistador.email = "smariob@gmail.com"
    entrevistador.telefone = "87-99999-6969"
    entrevistador.vaga_de_empregos = vaga_de_empregos(:uma_vaga)

    assert entrevistador.save, "Entrevistador criado com sucesso."
  end

  test "criacao de entrevistador sem nome" do
    entrevistador = Entrevistador.new
    entrevistador.nome = ""
    entrevistador.email = "smariob@gmail.com"
    entrevistador.telefone = "87-99999-6969"
    entrevistador.vaga_de_emprego = vaga_de_empregos(:uma_vaga)

    assert_not entrevistador.save, "Entrevistador nao pode ser criado sem nome"
  end

  test "criacao de entrevistador sem email" do
    entrevistador = Entrevistador.new
    entrevistador.nome = "Super Mario Bros"
    entrevistador.email = ""
    entrevistador.telefone = "87-99999-6969"
    entrevistador.vaga_de_emprego = vaga_de_empregos(:uma_vaga)

    assert_not entrevistador.save, "Entrevistador nao pode ser criado sem email"
  end
end
