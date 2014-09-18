class CreateChallengeMemberships < ActiveRecord::Migration
  def change
    create_table :challenge_memberships do |t|
      t.integer :challenge_id
      t.integer :user_id

      t.timestamps
    end
  end
end
