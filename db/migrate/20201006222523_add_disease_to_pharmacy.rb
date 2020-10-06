class AddDiseaseToPharmacy < ActiveRecord::Migration[6.0]
  def change
    add_column :pharmacies, :disease, :string
  end
end
