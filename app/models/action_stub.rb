class ActionStub < ActiveRecord::Base
  acts_as_superclass

  belongs_to :challenge

  def action_type
    return 'scavenger' if self.as_action_stub_type == 'ActionScavenger'
    return 'simpleshare' if self.as_action_stub_type == 'ActionSimpleshare'
  end
end
