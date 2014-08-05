class CreateActions < ActiveRecord::Migration
  def change
    create_table :actions do |t|
      t.string :name
      t.string :description
      t.boolean :enabled
      t.integer :challenge_id
      t.decimal :amt

      t.timestamps
    end
  end
end
