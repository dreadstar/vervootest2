class CreateChallengesSponsors < ActiveRecord::Migration
  def change
    create_table :challenges_sponsors do |t|
      t.integer :challenge_id
      t.integer :sponsor_id
    end
  end
end
