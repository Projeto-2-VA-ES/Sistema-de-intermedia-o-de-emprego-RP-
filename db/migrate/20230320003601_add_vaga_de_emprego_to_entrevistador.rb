class AddVagaDeEmpregoToEntrevistador < ActiveRecord::Migration[7.0]
  def change
    add_column :entrevistadors, :vaga_de_emprego_id, :integer
  end
end
