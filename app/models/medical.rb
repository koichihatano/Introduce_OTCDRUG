class Medical < ApplicationRecord
  belongs_to :user
  belongs_to :pharmacy
  belongs_to :user_pharmacy
end
