class ActionStub < ActiveRecord::Base
  acts_as_superclass

  belongs_to :challenge
end
