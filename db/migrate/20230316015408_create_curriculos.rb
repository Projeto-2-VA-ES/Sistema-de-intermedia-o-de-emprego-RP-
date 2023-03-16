class CreateCurriculos < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculos do |t|
      t.string :nome
      t.text :objetivo
      t.text :experiencia_profissional
      t.text :formacao_academica
      t.text :habilidades
      t.references :candidato, null: false, foreign_key: true

      t.timestamps
    end
  end
end
