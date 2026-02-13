class User < ApplicationRecord
  has_secure_password
  
  has_many :votos, dependent: :destroy

  validates :nombre, presence: true
  validates :cedula, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  def admin?
    role == "admin"
  end

  private

  def password_required?
    new_record? || password.present?
  end
end
