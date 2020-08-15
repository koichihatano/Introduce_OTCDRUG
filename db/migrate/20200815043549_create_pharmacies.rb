class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.integer :nickname
      t.string :age
      t.integer :sex
      t.text :counseling
      t.text :sick
      t.timestamps
    end
  end
end
