class Empregador < ApplicationRecord

  validates :nome, :nomeEmpresa,:cnpj, :email, :telefone, :endereco, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :telefone, format: { with: /\A\d{2}\d{4,5}\d{4}\z/, message: "formato inválido de telefone. Deve ser DD-XXXXX-XXXX" }
  validates :cnpj, uniqueness: true, format: { with: /\A\d{2}\.\d{3}\.\d{3}\/\d{4}-\d{2}\z/, message: "deve estar no formato XX.XXX.XXX/XXXX-XX" }
  validates :endereco, length: { minimum: 5 }
  validates :nome, exclusion: { in: %w(!@#$%¨&*()_+=[{]};:?/'")}, length: { minimum: 3 }

end
