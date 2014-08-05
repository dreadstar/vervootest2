class RemoveHeirColumnsFromActionStubs < ActiveRecord::Migration
  def change
    remove_column :action_stubs, :heir
    remove_column :action_stubs, :heir_type
  end
end
