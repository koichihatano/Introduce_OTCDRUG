class Pharmacy < ApplicationRecord
  belongs_to :user
  validates :counseling, presence: true, length: { maximum: 140 }

end
