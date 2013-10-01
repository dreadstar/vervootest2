class RemoveSubtypeFromActionScavengers < ActiveRecord::Migration
  def change
    remove_column :action_scavengers, :hint_msg, :text
    remove_column :action_scavengers, :found_msg, :text
  end
end
