class CreateVagaDeEmpregos < ActiveRecord::Migration[7.0]
  def change
    create_table :vaga_de_empregos do |t|
      t.string :titulo
      t.text :descricao
      t.float :salario
      t.references :empregador, null: false, foreign_key: true

      t.timestamps
    end
  end
end
