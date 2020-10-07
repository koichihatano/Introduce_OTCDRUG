class Pharmacy < ApplicationRecord
  belongs_to :user
  has_many :user_pharmacies, dependent: :destroy
  has_many :users, through: :user_pharmacies
  has_many :medicals, dependent: :destroy
end
