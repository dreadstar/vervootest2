class CreateActionSimpleshares < ActiveRecord::Migration
  def change
    create_table :action_simpleshares do |t|
      t.text :display_msg
      t.string :network_filter_list

      t.timestamps
    end
  end
end
