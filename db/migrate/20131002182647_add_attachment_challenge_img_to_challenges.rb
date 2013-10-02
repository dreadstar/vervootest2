class AddAttachmentChallengeImgToChallenges < ActiveRecord::Migration
  def self.up
    change_table :challenges do |t|
      t.attachment :challenge_img
    end
  end

  def self.down
    drop_attached_file :challenges, :challenge_img
  end
end
