class Voto < ApplicationRecord
  belongs_to :cargo
  belongs_to :candidato
  belongs_to :user  

  validates :cedula, uniqueness: {
    scope: :cargo_id,
    message: "esta cédula ya votó por este cargo"
  }
end