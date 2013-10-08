class AddHeirToActionBases < ActiveRecord::Migration
  def change
    add_column :action_bases, :heir, :integer
    add_column :action_bases, :heir_type, :string
  end
end
