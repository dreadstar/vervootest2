class AddAttachmentImgToSponsors < ActiveRecord::Migration
  def self.up
    change_table :sponsors do |t|
      t.attachment :img
    end
  end

  def self.down
    drop_attached_file :sponsors, :img
  end
end
