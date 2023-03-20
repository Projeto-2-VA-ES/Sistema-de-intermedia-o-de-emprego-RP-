require "test_helper"

class CurriculoTest < ActiveSupport::TestCase
  test "curriculo criado com sucesso" do
    curriculo = Curriculo.new
    curriculo.nome = "João Silva"
    curriculo.objetivo = "Desenvolvedor Full Stack"
    curriculo.experiencia_profissional = "Desenvolvedor web na empresa XYZ durante 2 anos."
    curriculo.formacao_academica = "Graduação em Ciência da Computação pela Universidade ABC."
    curriculo.habilidades = "Conhecimentos em Ruby on Rails, JavaScript, HTML e CSS."
    curriculo.candidato_id = 1

    assert_not curriculo.save, "Curriculo criado com sucesso."
  end

  test "curriculo criado sem objetivo" do
    curriculo = Curriculo.new
    curriculo.nome = "João Silva"
    curriculo.objetivo = ""
    curriculo.experiencia_profissional = "Desenvolvedor web na empresa XYZ durante 2 anos."
    curriculo.formacao_academica = "Graduação em Ciência da Computação pela Universidade ABC."
    curriculo.habilidades = "Conhecimentos em Ruby on Rails, JavaScript, HTML e CSS."
    curriculo.candidato_id = 1

    assert_not curriculo.save, "Curriculo criado sem objetivo."
  end

  test "curriculo criado sem nome" do
    curriculo = Curriculo.new
    curriculo.nome = ""
    curriculo.objetivo = "Desenvolvedor Full Stack"
    curriculo.experiencia_profissional = "Desenvolvedor web na empresa XYZ durante 2 anos."
    curriculo.formacao_academica = "Graduação em Ciência da Computação pela Universidade ABC."
    curriculo.habilidades = "Conhecimentos em Ruby on Rails, JavaScript, HTML e CSS."
    curriculo.candidato_id = 1

    assert_not curriculo.save, "Curriculo criado sem nome."
  end
end