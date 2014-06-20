class CreateScavengerItems < ActiveRecord::Migration
  def change
    create_table :scavenger_items do |t|
      t.integer :action_scavenger_id
      t.text :hint_msg
      t.text :found_msg
      t.decimal :order, precision: 10, scale: 0
      t.decimal :find_amt, precision: 10, scale: 3

      t.timestamps
    end
  end
end
