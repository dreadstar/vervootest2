class ActionBase < ActiveRecord::Base
  acts_as_predecessor
  belongs_to :challenge
end
