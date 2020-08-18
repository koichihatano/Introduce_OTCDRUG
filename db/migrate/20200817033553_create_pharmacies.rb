class CreatePharmacies < ActiveRecord::Migration[6.0]
  def change
    create_table :pharmacies do |t|
      t.string :nickname
      t.integer :age
      t.string :sex
      t.text :counseling
      t.string :sick
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
