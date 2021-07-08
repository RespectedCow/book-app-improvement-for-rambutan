class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :full_name # creates a column called full_name
      t.string :email # creates a column email
      t.timestamps # creates two columns for storing timestamps
    end
  end
end
