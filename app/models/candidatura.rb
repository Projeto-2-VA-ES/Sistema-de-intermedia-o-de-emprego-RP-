class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga_de_empregos, class_name: "VagaDeEmprego"

  validates :candidato, presence: true
  validates :vaga_de_empregos, presence: true

end
