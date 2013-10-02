class AddAttachmentThumbToSponsors < ActiveRecord::Migration
  def self.up
    change_table :sponsors do |t|
      t.attachment :thumb
    end
  end

  def self.down
    drop_attached_file :sponsors, :thumb
  end
end
