require "test_helper"

class EmpregadorTest < ActiveSupport::TestCase

  test "salvar empregador com sucesso" do
    empregador = Empregador.new
    empregador.nome = " Rian Wilker "
    empregador.nomeEmpresa = "12345678901"
    empregador.cnpj = "12.345.678/0001-00"
    empregador.telefone = "87-99258-9444"
    empregador.endereco = "Rua Almir pacherco"

    assert empregador.save, "Salvou empregador com sucesso"

  end

  test "salvar empregador sem CNPJ" do
    empregador = Empregador.new
    empregador.nome = "Rian Wilker"
    empregador.nomeEmpresa = "Frios LDTA"
    empregador.cnpj = "12.345.678/0001-00"
    empregador.telefone = "87-99258-9444"
    empregador.endereco = "Rua Almir Pacheco"

    assert empregador.save, "Salvou empregador sem CNPJ"

  end

  test "salvar empregador sem endereço" do
    empregador = Empregador.new
    empregador.nome = "Rian Wilker"
    empregador.nomeEmpresa = "Frios LDTA"
    empregador.cnpj = "12.345.678/0001-00"
    empregador.telefone = "87-99258-9444"
    empregador.endereco = ""

    assert empregador.save, "Salvou empregador sem endereco"

  end

end
