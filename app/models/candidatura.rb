class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga_de_emprego, class_name: "VagaDeEmprego"

  validates :candidato, presence: true
  validates :vaga_de_emprego, presence: true

end
