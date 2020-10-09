class RemoveNicknameToPharmacies < ActiveRecord::Migration[6.0]
  def change
    remove_column :pharmacies, :nickname, :string

  end
end
