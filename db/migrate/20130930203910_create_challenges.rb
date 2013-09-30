class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :challenge_img
      t.decimal :total_offer
      t.decimal :amount_raised
      t.text :sponsor_blurb
      t.text :charity_blurb
      t.boolean :enabled
      t.string :seo_name
      t.string :img_thumb_url
      t.string :logo_url

      t.timestamps
    end
  end
end
