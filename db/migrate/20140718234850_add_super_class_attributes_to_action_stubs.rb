class AddSuperClassAttributesToActionStubs < ActiveRecord::Migration
  def change
    add_column :action_stubs, :as_action_stub_id, :integer
    add_column :action_stubs, :as_action_stub_type, :string
  end
end
