class AddUserIdToOrganization < ActiveRecord::Migration[6.1]
  def change
    change_table :organizations do |t|
      t.belongs_to :user
    end
  end
end