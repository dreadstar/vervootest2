class AddAmtToScavengerItems < ActiveRecord::Migration
  def change
    add_column :scavenger_items, :find_amt, :decimal
  end
end
