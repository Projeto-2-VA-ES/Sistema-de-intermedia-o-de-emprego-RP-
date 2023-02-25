class CreateEmpregadors < ActiveRecord::Migration[7.0]
  def change
    create_table :empregadors do |t|
      t.string :nome
      t.string :nomeEmpresa
      t.string :email
      t.string :endereco
      t.integer :telefone
      t.string :cpnj

      t.timestamps
    end
  end
end
