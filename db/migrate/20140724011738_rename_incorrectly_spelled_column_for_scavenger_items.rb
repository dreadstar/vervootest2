class RenameIncorrectlySpelledColumnForScavengerItems < ActiveRecord::Migration
  def change
    rename_column :scavenger_items, :action_savenger_id, :action_scavenger_id
  end
end
