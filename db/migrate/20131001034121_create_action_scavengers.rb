class CreateActionScavengers < ActiveRecord::Migration
  def change
    create_table :action_scavengers, :inherits => :action do |t|
      t.text :hint_msg
      t.text :found_msg
      t.boolean :team

      t.timestamps
    end
  end
end
