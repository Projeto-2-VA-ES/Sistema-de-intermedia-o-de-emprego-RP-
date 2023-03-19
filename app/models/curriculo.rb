class Curriculo < ApplicationRecord
  belongs_to :candidato

  validates :nome, presence: true
  validates :objetivo, length: { maximum: 200 }
  validates :experiencia_profissional, presence: true
  validates :formacao_academica, presence: true
  validates :habilidades, presence: true
end
