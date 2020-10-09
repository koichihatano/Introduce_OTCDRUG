class RemoveAgeToPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacies, :age, :string

  end
end
