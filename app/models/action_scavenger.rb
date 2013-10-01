class ActionScavenger < ActiveRecord::Base
  acts_as_heir_of :action
  has_many :scavenger_items
end
