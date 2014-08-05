class AddSubTypeToActions < ActiveRecord::Migration
  def change
    add_column :actions, :subtype, :string
  end
end
