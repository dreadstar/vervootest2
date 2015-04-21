class AddNameToScavengerItems < ActiveRecord::Migration
  def change
    add_column :scavenger_items, :name, :string
  end
end
