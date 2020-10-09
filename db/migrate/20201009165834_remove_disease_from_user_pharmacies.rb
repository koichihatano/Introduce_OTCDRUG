class RemoveDiseaseFromUserPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_pharmacies, :disease, :string
  end
end
