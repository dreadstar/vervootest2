class AddTherestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name_first, :string
    add_column :users, :name_last, :string
    add_column :users, :name_middle, :string
    add_column :users, :username, :string
    add_column :users, :dob_date, :datetime
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :province, :string
    add_column :users, :postal_code, :string
    add_column :users, :country, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :string
    add_column :users, :img_url, :string
    add_column :users, :fax, :string
  end
end
