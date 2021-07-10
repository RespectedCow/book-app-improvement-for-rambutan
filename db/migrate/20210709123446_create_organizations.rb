class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.integer :owner_id
      t.string :name
      t.timestamps
    end
  end
end
