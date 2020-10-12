class Pharmacy < ApplicationRecord
  has_many :users, through: :user_pharmacies
  has_many :medicals, dependent: :destroy
  validates :counseling, presence: true, length: { maximum: 140 }

end
