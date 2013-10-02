class AddAttachmentImgThumbUrlToChallenges < ActiveRecord::Migration
  def self.up
    change_table :challenges do |t|
      t.attachment :img_thumb_url
    end
  end

  def self.down
    drop_attached_file :challenges, :img_thumb_url
  end
end
