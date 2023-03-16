require "application_system_test_case"

class CurriculosTest < ApplicationSystemTestCase
  setup do
    @curriculo = curriculos(:one)
  end

  test "visiting the index" do
    visit curriculos_url
    assert_selector "h1", text: "Curriculos"
  end

  test "should create curriculo" do
    visit curriculos_url
    click_on "New curriculo"

    fill_in "Candidato", with: @curriculo.candidato_id
    fill_in "Experiencia profissional", with: @curriculo.experiencia_profissional
    fill_in "Formacao academica", with: @curriculo.formacao_academica
    fill_in "Habilidades", with: @curriculo.habilidades
    fill_in "Nome", with: @curriculo.nome
    fill_in "Objetivo", with: @curriculo.objetivo
    click_on "Create Curriculo"

    assert_text "Curriculo was successfully created"
    click_on "Back"
  end

  test "should update Curriculo" do
    visit curriculo_url(@curriculo)
    click_on "Edit this curriculo", match: :first

    fill_in "Candidato", with: @curriculo.candidato_id
    fill_in "Experiencia profissional", with: @curriculo.experiencia_profissional
    fill_in "Formacao academica", with: @curriculo.formacao_academica
    fill_in "Habilidades", with: @curriculo.habilidades
    fill_in "Nome", with: @curriculo.nome
    fill_in "Objetivo", with: @curriculo.objetivo
    click_on "Update Curriculo"

    assert_text "Curriculo was successfully updated"
    click_on "Back"
  end

  test "should destroy Curriculo" do
    visit curriculo_url(@curriculo)
    click_on "Destroy this curriculo", match: :first

    assert_text "Curriculo was successfully destroyed"
  end
end
