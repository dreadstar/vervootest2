class RemoveSubtypeFromActions < ActiveRecord::Migration
  def change
    remove_column :actions, :subtype, :string
  end
end
