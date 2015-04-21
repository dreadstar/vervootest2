class AddImagesToNonprofits < ActiveRecord::Migration
  def change
    add_column :nonprofits, :image_full, :string
    add_column :nonprofits, :image_thumb, :string
  end
end
