class Candidato < ApplicationRecord
  has_many :vaga_de_empregos
  has_many :empregadors, through: :vaga_de_empregos

  validates :nome, presence: true, exclusion: { in: %w(!@#$%¨&*()_+=[{]};:?/'")}, length: { minimum: 2 }
  validates :email, presence: true, length: {minimum: 11}, uniqueness: true
  validates :cpf, presence: true, numericality: { only_integer: true }, uniqueness: true, length: { is: 11 }, exclusion: { in: %w(!@#$%¨&*()_+=[{]};:?/'") }
  validates :dataNascimento, presence: true, presence: { message: "Data de nascimento é obrigatória!" }, comparison: { less_than: DateTime.now, message: "Data de nascimento inválida" }
  validates :telefone, format: { with: /\A\d{2}-\d{4,5}-\d{4}\z/, message: "formato inválido de telefone. Deve ser DD-XXXXX-XXXX" }
end
