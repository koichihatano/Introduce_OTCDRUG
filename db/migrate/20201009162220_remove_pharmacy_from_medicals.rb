class RemovePharmacyFromMedicals < ActiveRecord::Migration[6.0]
  def change
    remove_reference :medicals, :pharmacy, null: false, foreign_key: true
  end
end
