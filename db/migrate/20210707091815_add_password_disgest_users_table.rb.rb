class AddPasswordDisgestUsersTable < ActiveRecord::Migration[6.1]
  def change
    change_table :users do |t|
      t.string :password_digest
    end
  end
end
