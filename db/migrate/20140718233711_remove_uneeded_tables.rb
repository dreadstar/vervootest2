class RemoveUneededTables < ActiveRecord::Migration
  def change
    drop_table(:actions)
    drop_table(:action_bases)
  end
end
