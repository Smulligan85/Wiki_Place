class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, null: false, default: 'standard'
  end
end
