class AddImagesToSponsors < ActiveRecord::Migration
  def change
    add_column :sponsors, :image_full, :string
    add_column :sponsors, :image_thumb, :string
  end
end
