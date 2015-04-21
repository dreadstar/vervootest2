class AddPrereqflagToScavengerItems < ActiveRecord::Migration
  def change
    add_column :scavenger_items, :prereq_flag, :boolean
  end
end
