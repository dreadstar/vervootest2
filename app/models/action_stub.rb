class ActionStub < ActiveRecord::Base
  # acts_as_predecessor
  belongs_to :challenge
  validates :name, presence: true
end
