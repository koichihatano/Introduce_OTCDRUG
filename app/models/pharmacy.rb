class Pharmacy < ApplicationRecord
  belongs_to :user
  validates :counseling, presence: true, length: { maximum: 140 }
  has_many :user_pharmacies, dependent: :destroy
  has_many :users, through: :user_pharmacies
  accepts_nested_attributes_for :user_pharmacies
end
