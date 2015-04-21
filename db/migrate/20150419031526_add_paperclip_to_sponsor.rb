class AddPaperclipToSponsor < ActiveRecord::Migration
  def change
    add_attachment :sponsors, :image_full
    add_attachment :sponsors, :image_thumb
  end
end
