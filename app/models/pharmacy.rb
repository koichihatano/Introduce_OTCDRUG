class Pharmacy < ApplicationRecord
belongs_to :user, optional: true
end
