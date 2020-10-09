class RemoveSexToPharmacies < ActiveRecord::Migration[6.0]
  def change
      remove_column :pharmacies, :sex, :string

  end
end
