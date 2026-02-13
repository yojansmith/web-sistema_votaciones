class Candidato < ApplicationRecord
  belongs_to :cargo
  belongs_to :partido
  has_one_attached :foto
  has_many :votos, dependent: :destroy

  validates :nombre, presence: true
  validates :propuesta, presence: true
end