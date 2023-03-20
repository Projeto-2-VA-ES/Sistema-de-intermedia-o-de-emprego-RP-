class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga_de_emprego

  validates :mensagem, presence: true, length: { minimum: 10 }

end
