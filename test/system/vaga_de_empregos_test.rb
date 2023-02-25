require "application_system_test_case"

class VagaDeEmpregosTest < ApplicationSystemTestCase
  setup do
    @vaga_de_emprego = vaga_de_empregos(:one)
  end

  test "visiting the index" do
    visit vaga_de_empregos_url
    assert_selector "h1", text: "Vaga de empregos"
  end

  test "should create vaga de emprego" do
    visit vaga_de_empregos_url
    click_on "New vaga de emprego"

    fill_in "Descricao", with: @vaga_de_emprego.descricao
    fill_in "Empregador", with: @vaga_de_emprego.empregador_id
    fill_in "Salario", with: @vaga_de_emprego.salario
    fill_in "Titulo", with: @vaga_de_emprego.titulo
    click_on "Create Vaga de emprego"

    assert_text "Vaga de emprego was successfully created"
    click_on "Back"
  end

  test "should update Vaga de emprego" do
    visit vaga_de_emprego_url(@vaga_de_emprego)
    click_on "Edit this vaga de emprego", match: :first

    fill_in "Descricao", with: @vaga_de_emprego.descricao
    fill_in "Empregador", with: @vaga_de_emprego.empregador_id
    fill_in "Salario", with: @vaga_de_emprego.salario
    fill_in "Titulo", with: @vaga_de_emprego.titulo
    click_on "Update Vaga de emprego"

    assert_text "Vaga de emprego was successfully updated"
    click_on "Back"
  end

  test "should destroy Vaga de emprego" do
    visit vaga_de_emprego_url(@vaga_de_emprego)
    click_on "Destroy this vaga de emprego", match: :first

    assert_text "Vaga de emprego was successfully destroyed"
  end
end
