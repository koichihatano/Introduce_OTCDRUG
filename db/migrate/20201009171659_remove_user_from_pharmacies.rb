class RemoveUserFromPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pharmacies, :user, null: false, foreign_key: true
  end
end
