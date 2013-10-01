class CreateChallengesTeammembers < ActiveRecord::Migration
  def change
    create_table :challenges_teammembers do |t|
      t.integer :challenge_id
      t.integer :user_id
    end
  end
end
