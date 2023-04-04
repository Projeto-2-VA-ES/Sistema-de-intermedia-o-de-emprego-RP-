# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_16_020707) do
  create_table "candidatos", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "cpf"
    t.date "dataNascimento"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidatos_vagas_de_empregos", id: false, force: :cascade do |t|
    t.integer "candidato_id", null: false
    t.integer "vagas_de_emprego_id", null: false
  end

  create_table "candidaturas", force: :cascade do |t|
    t.text "mensagem"
    t.integer "candidato_id", null: false
    t.integer "vaga_de_emprego_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidato_id"], name: "index_candidaturas_on_candidato_id"
    t.index ["vaga_de_emprego_id"], name: "index_candidaturas_on_vaga_de_emprego_id"
  end

  create_table "curriculos", force: :cascade do |t|
    t.string "nome"
    t.text "objetivo"
    t.text "experiencia_profissional"
    t.text "formacao_academica"
    t.text "habilidades"
    t.integer "candidato_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidato_id"], name: "index_curriculos_on_candidato_id"
  end

  create_table "empregadors", force: :cascade do |t|
    t.string "nome"
    t.string "nomeEmpresa"
    t.string "email"
    t.string "endereco"
    t.string "telefone"
    t.string "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entrevistadors", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.string "telefone"
    t.integer "vaga_de_emprego_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vaga_de_emprego_id"], name: "index_entrevistadors_on_vaga_de_emprego_id"
  end

  create_table "vaga_de_empregos", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.float "salario"
    t.integer "empregador_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["empregador_id"], name: "index_vaga_de_empregos_on_empregador_id"
  end

  add_foreign_key "candidaturas", "candidatos"
  add_foreign_key "candidaturas", "vaga_de_empregos"
  add_foreign_key "curriculos", "candidatos"
  add_foreign_key "entrevistadors", "vaga_de_empregos", on_delete: :cascade
  add_foreign_key "vaga_de_empregos", "empregadors"
end
