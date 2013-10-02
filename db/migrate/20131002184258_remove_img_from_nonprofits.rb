class RemoveImgFromNonprofits < ActiveRecord::Migration
  def change
    remove_column :nonprofits, :img_thumb_url, :string
    remove_column :nonprofits, :img_url, :string
  end
end
