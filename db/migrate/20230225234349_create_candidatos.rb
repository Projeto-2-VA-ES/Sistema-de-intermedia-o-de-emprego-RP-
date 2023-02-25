class CreateCandidatos < ActiveRecord::Migration[7.0]
  def change
    create_table :candidatos do |t|
      t.string :nome
      t.string :email
      t.string :cpf
      t.date :dataNascimento
      t.string :telefone

      t.timestamps
    end
  end
end
