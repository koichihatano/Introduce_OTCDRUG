class UserPharmacy < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  belongs_to :medical
end
