class AddSeqrevealflagToActionScavengers < ActiveRecord::Migration
  def change
    add_column :action_scavengers, :seqreveal_flag, :boolean
  end
end
