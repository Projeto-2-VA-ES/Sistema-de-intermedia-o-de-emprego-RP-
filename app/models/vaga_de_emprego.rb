class VagaDeEmprego < ApplicationRecord
  belongs_to :empregador
  has_many :candidatoes

  validates :titulo, presence: true, length: { minimum: 5 }
  validates :descricao, presence: true, length: { minimum: 10 }
  validates :salario, presence: true, numericality: { greater_than: 0 }
end
