class VagaDeEmprego < ApplicationRecord
  belongs_to :empregador
  belongs_to :candidato
  has_many :candidatoes

  validates :titulo, presence: true, length: { minimum: 5, maximum: 100 },
            format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "apenas letras, números e espaços são permitidos" }
  validates :descricao, presence: true, length: { minimum: 10, maximum: 500 }
  validates :salario, presence: true, numericality: { greater_than: 0, less_than_or_equal_to: 9999999 }
end
