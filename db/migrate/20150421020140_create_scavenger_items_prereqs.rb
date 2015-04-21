class CreateScavengerItemsPrereqs < ActiveRecord::Migration
  def change
    create_table :scavenger_items_prereqs do |t|
      t.integer :scavenger_item_id
      t.integer :prereq_id
      t.index [:scavenger_item_id, :prereq_id]
    end
  end
end
