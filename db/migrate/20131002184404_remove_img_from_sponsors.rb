class RemoveImgFromSponsors < ActiveRecord::Migration
  def change
    remove_column :sponsors, :img_thumb_url, :string
    remove_column :sponsors, :img_url, :string
  end
end
