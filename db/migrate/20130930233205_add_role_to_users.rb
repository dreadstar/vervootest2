class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role_type, :string
    add_column :users, :id_organization, :integer
  end
end
