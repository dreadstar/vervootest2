class CreateActionBases < ActiveRecord::Migration
  def change
    create_table :action_bases do |t|
      t.string :name
      t.text :description
      t.boolean :enabled
      t.integer :challenge_id
      t.decimal :amt

      t.timestamps
    end
  end
end
