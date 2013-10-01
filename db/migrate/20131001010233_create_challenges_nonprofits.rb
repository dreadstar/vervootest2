class CreateChallengesNonprofits < ActiveRecord::Migration
  def change
    create_table :challenges_nonprofits do |t|
      t.integer :challenge_id
      t.integer :nonprofit_id
    end
  end
end
