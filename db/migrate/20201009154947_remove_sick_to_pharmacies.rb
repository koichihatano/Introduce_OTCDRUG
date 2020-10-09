class RemoveSickToPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacies, :sick, :string

  end
end
