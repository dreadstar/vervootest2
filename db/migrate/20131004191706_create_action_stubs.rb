class CreateActionStubs < ActiveRecord::Migration
  def change
    create_table :action_stubs do |t|
      t.string :name
      t.text :description
      t.boolean :enabled
      t.integer :challenge_id
      t.decimal :amt
      t.integer :heir
      t.string :heir_type

      t.timestamps
    end
  end
end
