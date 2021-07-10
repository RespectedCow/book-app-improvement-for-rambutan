class AddDescriptionToOrganization < ActiveRecord::Migration[6.1]
  def change
    change_table :organizations do |t|
      t.text :description
    end
  end
end
