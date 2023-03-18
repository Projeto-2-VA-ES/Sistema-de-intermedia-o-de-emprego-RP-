class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga_de_emprego
  belongs_to :entrevistador
  has_one :entrevistador, through: :vaga_de_empregos
  has_one :empregador, through: :entrevistador
  has_one :curriculo, through: :candidato

  validates :mensagem, presence: true, length: { minimum: 10 }

end
