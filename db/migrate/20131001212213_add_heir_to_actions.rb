class AddHeirToActions < ActiveRecord::Migration
  def change
    add_column :actions, :heir_type, :string
    add_column :actions, :heir_id, :integer
  end
end
