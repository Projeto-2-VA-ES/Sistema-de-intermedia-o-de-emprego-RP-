class CreateJoinTableCandidatoVagaDeEmprego < ActiveRecord::Migration[7.0]
  def change
    create_join_table :candidatos, :vagas_de_empregos do |t|
      #t.index [:candidato_id, :vaga_de_emprego_id]
      #t.index [:vaga_de_emprego_id, :candidato_id]
    end
  end
end
