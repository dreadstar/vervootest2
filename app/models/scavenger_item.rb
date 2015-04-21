class ScavengerItem < ActiveRecord::Base
  belongs_to :action_scavenger
  has_and_belongs_to_many :prereqs,
              class_name: "ScavengerItem",
              join_table: :scavenger_items_prereqs,
              foreign_key: :scavenger_item_id,
              association_foreign_key: :prereq_id
end
