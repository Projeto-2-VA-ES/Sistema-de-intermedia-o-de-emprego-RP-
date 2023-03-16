require "test_helper"

class EntrevistadorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entrevistador = entrevistadors(:one)
  end

  test "should get index" do
    get entrevistadors_url
    assert_response :success
  end

  test "should get new" do
    get new_entrevistador_url
    assert_response :success
  end

  test "should create entrevistador" do
    assert_difference("Entrevistador.count") do
      post entrevistadors_url, params: { entrevistador: { email: @entrevistador.email, nome: @entrevistador.nome, telefone: @entrevistador.telefone, vaga_de_empregos_id: @entrevistador.vaga_de_empregos_id } }
    end

    assert_redirected_to entrevistador_url(Entrevistador.last)
  end

  test "should show entrevistador" do
    get entrevistador_url(@entrevistador)
    assert_response :success
  end

  test "should get edit" do
    get edit_entrevistador_url(@entrevistador)
    assert_response :success
  end

  test "should update entrevistador" do
    patch entrevistador_url(@entrevistador), params: { entrevistador: { email: @entrevistador.email, nome: @entrevistador.nome, telefone: @entrevistador.telefone, vaga_de_empregos_id: @entrevistador.vaga_de_empregos_id } }
    assert_redirected_to entrevistador_url(@entrevistador)
  end

  test "should destroy entrevistador" do
    assert_difference("Entrevistador.count", -1) do
      delete entrevistador_url(@entrevistador)
    end

    assert_redirected_to entrevistadors_url
  end
end
