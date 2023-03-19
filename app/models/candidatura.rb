class Candidatura < ApplicationRecord
  belongs_to :candidato
  has_many :vaga_de_empregos
  has_one :entrevistador, through: :vaga_de_empregos
  has_one :empregador, through: :entrevistador

  validates :mensagem, presence: true, length: { minimum: 10 }

end
