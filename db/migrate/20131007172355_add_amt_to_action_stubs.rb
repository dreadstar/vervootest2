class AddAmtToActionStubs < ActiveRecord::Migration
  def change
    add_column :action_stubs, :amt, :decimal, precision: 10, scale: 3
  end
end
