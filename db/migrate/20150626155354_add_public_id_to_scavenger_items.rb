class AddPublicIdToScavengerItems < ActiveRecord::Migration
  def change
    add_column :scavenger_items, :public_id, :string
  end
end
