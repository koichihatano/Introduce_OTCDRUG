class AddNameToMedical < ActiveRecord::Migration[6.0]
  def change
    add_column :medicals, :name, :string
    add_column :medicals, :url, :string
  end
end
