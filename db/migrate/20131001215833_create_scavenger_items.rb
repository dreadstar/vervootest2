class CreateScavengerItems < ActiveRecord::Migration
  def change
    create_table :scavenger_items do |t|
      t.integer :action_savenger_id
      t.text :hint_msg
      t.text :found_msg
      t.decimal :order

      t.timestamps
    end
  end
end
