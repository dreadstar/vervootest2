class RemoveImgFromChallenges < ActiveRecord::Migration
  def change
    remove_column :challenges, :challenge_img, :string
  end
end
