class CreateMedicals < ActiveRecord::Migration[6.0]
  def change
    create_table :medicals do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pharmacy, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
