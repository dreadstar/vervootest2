class DropChallengeTeammates < ActiveRecord::Migration
  def change
    drop_table :challenges_teammembers
  end
end
