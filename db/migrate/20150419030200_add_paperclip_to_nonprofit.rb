class AddPaperclipToNonprofit < ActiveRecord::Migration
  def change
    add_attachment :nonprofits, :image_full
    add_attachment :nonprofits, :image_thumb
  end

end
