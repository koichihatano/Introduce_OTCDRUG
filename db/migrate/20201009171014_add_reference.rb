class AddReference < ActiveRecord::Migration[6.0]
  def change
    add_reference :pharmacies, :medical
  end
end
