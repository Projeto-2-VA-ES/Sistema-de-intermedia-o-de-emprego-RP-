require "test_helper"

class VagaDeEmpregoTest < ActiveSupport::TestCase
  test "vaga de emprego criada com sucesso" do
    vaga_de_emprego = VagaDeEmprego.new
    vaga_de_emprego.titulo = "Recepcionista"
    vaga_de_emprego.descricao = "Clínica Odontológica admite Recepcionista em Garanhuns (Santo Antônio) para atuar em Tempo integral, Comercial.\n
                                Marcar consultas e controlar agenda. Direcionar clientes até as salas de atendimento. Preparar e abastecer área de atendimento.\n
                                É oferecido contrato Efetivo, Beneficios a combinar / vaga cód:902429757"
    vaga_de_emprego.salario = "R$ 1.380,60"

    assert vaga_de_emprego.save, "Vaga de emprego criada com sucesso."
  end

  test "vaga de emprego criada sem descrição" do
    vaga_de_emprego = VagaDeEmprego.new
    vaga_de_emprego.titulo = "Recepcionista"
    vaga_de_emprego.descricao = ""
    vaga_de_emprego.salario = "R$ 1.380,60"

    assert vaga_de_emprego.save, "Vaga de emprego criada sem descrição."
  end

  test "vaga de emprego criada sem salário" do
    vaga_de_emprego = VagaDeEmprego.new
    vaga_de_emprego.titulo = "Recepcionista"
    vaga_de_emprego.descricao = "Clínica Odontológica admite Recepcionista em Garanhuns (Santo Antônio) para atuar em Tempo integral, Comercial.\n
                                Marcar consultas e controlar agenda. Direcionar clientes até as salas de atendimento. Preparar e abastecer área de atendimento.\n
                                É oferecido contrato Efetivo, Beneficios a combinar / vaga cód:902429757"
    vaga_de_emprego.salario = ""

    assert vaga_de_emprego.save, "Vaga de emprego criada sem salário."
  end
  
end
