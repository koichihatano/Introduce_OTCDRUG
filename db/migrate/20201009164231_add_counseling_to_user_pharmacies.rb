class AddCounselingToUserPharmacies < ActiveRecord::Migration[6.0]
  def change
    add_column :user_pharmacies, :counseling, :text
  end
end
