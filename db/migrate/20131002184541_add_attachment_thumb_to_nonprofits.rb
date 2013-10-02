class AddAttachmentThumbToNonprofits < ActiveRecord::Migration
  def self.up
    change_table :nonprofits do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :nonprofits, :thumb
  end
end
