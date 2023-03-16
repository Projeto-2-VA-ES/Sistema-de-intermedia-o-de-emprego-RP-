require "application_system_test_case"

class EntrevistadorsTest < ApplicationSystemTestCase
  setup do
    @entrevistador = entrevistadors(:one)
  end

  test "visiting the index" do
    visit entrevistadors_url
    assert_selector "h1", text: "Entrevistadors"
  end

  test "should create entrevistador" do
    visit entrevistadors_url
    click_on "New entrevistador"

    fill_in "Email", with: @entrevistador.email
    fill_in "Nome", with: @entrevistador.nome
    fill_in "Telefone", with: @entrevistador.telefone
    fill_in "Vaga de empregos", with: @entrevistador.vaga_de_empregos_id
    click_on "Create Entrevistador"

    assert_text "Entrevistador was successfully created"
    click_on "Back"
  end

  test "should update Entrevistador" do
    visit entrevistador_url(@entrevistador)
    click_on "Edit this entrevistador", match: :first

    fill_in "Email", with: @entrevistador.email
    fill_in "Nome", with: @entrevistador.nome
    fill_in "Telefone", with: @entrevistador.telefone
    fill_in "Vaga de empregos", with: @entrevistador.vaga_de_empregos_id
    click_on "Update Entrevistador"

    assert_text "Entrevistador was successfully updated"
    click_on "Back"
  end

  test "should destroy Entrevistador" do
    visit entrevistador_url(@entrevistador)
    click_on "Destroy this entrevistador", match: :first

    assert_text "Entrevistador was successfully destroyed"
  end
end
