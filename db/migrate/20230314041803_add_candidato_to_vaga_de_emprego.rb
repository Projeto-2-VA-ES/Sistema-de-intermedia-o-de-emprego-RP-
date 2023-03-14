class AddCandidatoToVagaDeEmprego < ActiveRecord::Migration[7.0]
  def change
    add_reference :vaga_de_empregos, :candidato, null: false, foreign_key: true
  end
end
