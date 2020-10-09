class RemoveUserFromMedicals < ActiveRecord::Migration[6.0]
  def change
    remove_reference :medicals, :user, null: false, foreign_key: true
  end
end
