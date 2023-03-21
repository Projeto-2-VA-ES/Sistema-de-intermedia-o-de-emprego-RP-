class Entrevistador < ApplicationRecord
  belongs_to :vaga_de_emprego


  validates :nome, presence: true, exclusion: { in: %w(!@#$%¨&*()_+=[{]};:?/'")}, length: { minimum: 2 }
  validates :email, presence: true, length: {minimum: 11}, uniqueness: true
  validates :telefone, format: { with: /\A\d{2}-\d{4,5}-\d{4}\z/, message: "formato inválido de telefone. Deve ser DD-XXXXX-XXXX" }
end
