class RemoveCounselingToPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacies, :counseling, :text

  end
end
