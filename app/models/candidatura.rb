class Candidatura < ApplicationRecord
  belongs_to :candidato, :dependent => :destroy
  belongs_to :vaga_de_emprego, class_name: "VagaDeEmprego", :dependent => :destroy

  validates :candidato, presence: true
  validates :vaga_de_emprego, presence: true

end
