class AddRolesIdToRolesUsers < ActiveRecord::Migration
  def change
    add_column :roles_users, :role_id, :integer
  end
end