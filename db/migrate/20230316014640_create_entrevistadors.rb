class CreateEntrevistadors < ActiveRecord::Migration[7.0]
  def change
    create_table :entrevistadors do |t|
      t.string :nome
      t.string :email
      t.string :telefone
      t.references :vaga_de_emprego, null: false, foreign_key: true

      t.timestamps
    end
  end
end
