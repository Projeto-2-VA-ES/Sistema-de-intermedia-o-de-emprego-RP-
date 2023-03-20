class Candidatura < ApplicationRecord
  belongs_to :candidato
  belongs_to :vaga_de_empregos
end
