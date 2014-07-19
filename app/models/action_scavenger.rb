class ActionScavenger < ActiveRecord::Base
  acts_as :action_stub

  has_many :scavenger_items, :dependent => :destroy
  accepts_nested_attributes_for :scavenger_items, :reject_if => lambda { |a| a[:hint_msg].blank?  }, :allow_destroy => true
  # OR a[:find_amt]?
end
