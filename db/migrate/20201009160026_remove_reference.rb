class RemoveReference < ActiveRecord::Migration[6.0]
  def change
  remove_foreign_key :user_pharmacies, :medicals
  remove_reference :user_pharmacies, :medical, index: true
  end
end
