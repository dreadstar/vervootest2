class AddOwnerToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :owner_id, :integer
  end
end
