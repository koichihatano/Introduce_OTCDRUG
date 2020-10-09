class RemoveColumns < ActiveRecord::Migration[6.0]
  def change
  remove_columns :users, :nickname, :counseling, :sick
  end
end
