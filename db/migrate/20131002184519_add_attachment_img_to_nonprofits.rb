class AddAttachmentImgToNonprofits < ActiveRecord::Migration
  def self.up
    change_table :nonprofits do |t|
      t.attachment :img
    end
  end

  def self.down
    drop_attached_file :nonprofits, :img
  end
end
