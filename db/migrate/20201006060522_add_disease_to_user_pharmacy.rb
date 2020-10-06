class AddDiseaseToUserPharmacy < ActiveRecord::Migration[6.0]
  def change
    add_column :user_pharmacies, :disease, :string
  end
end
