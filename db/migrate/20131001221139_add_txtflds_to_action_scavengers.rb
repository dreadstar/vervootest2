class AddTxtfldsToActionScavengers < ActiveRecord::Migration
  def change
    add_column :action_scavengers, :start_msg, :text
    add_column :action_scavengers, :complete_msg, :text
  end
end
