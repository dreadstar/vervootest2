class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :email
      t.boolean :enabled
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :province
      t.string :postal_code
      t.string :country
      t.string :phone_number
      t.string :img_url
      t.string :website
      t.string :seo_name
      t.string :img_thumb_url

      t.timestamps
    end
  end
end
