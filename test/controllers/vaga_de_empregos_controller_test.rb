require "test_helper"

class VagaDeEmpregosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vaga_de_emprego = vaga_de_empregos(:one)
  end

  test "should get index" do
    get vaga_de_empregos_url
    assert_response :success
  end

  test "should get new" do
    get new_vaga_de_emprego_url
    assert_response :success
  end

  test "should create vaga_de_emprego" do
    assert_difference("VagaDeEmprego.count") do
      post vaga_de_empregos_url, params: { vaga_de_emprego: { descricao: @vaga_de_emprego.descricao, empregador_id: @vaga_de_emprego.empregador_id, salario: @vaga_de_emprego.salario, titulo: @vaga_de_emprego.titulo } }
    end

    assert_redirected_to vaga_de_emprego_url(VagaDeEmprego.last)
  end

  test "should show vaga_de_emprego" do
    get vaga_de_emprego_url(@vaga_de_emprego)
    assert_response :success
  end

  test "should get edit" do
    get edit_vaga_de_emprego_url(@vaga_de_emprego)
    assert_response :success
  end

  test "should update vaga_de_emprego" do
    patch vaga_de_emprego_url(@vaga_de_emprego), params: { vaga_de_emprego: { descricao: @vaga_de_emprego.descricao, empregador_id: @vaga_de_emprego.empregador_id, salario: @vaga_de_emprego.salario, titulo: @vaga_de_emprego.titulo } }
    assert_redirected_to vaga_de_emprego_url(@vaga_de_emprego)
  end

  test "should destroy vaga_de_emprego" do
    assert_difference("VagaDeEmprego.count", -1) do
      delete vaga_de_emprego_url(@vaga_de_emprego)
    end

    assert_redirected_to vaga_de_empregos_url
  end
end
