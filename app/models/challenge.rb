class Challenge < ActiveRecord::Base
    has_many :action_stubs, :dependent => :destroy
    has_many :nonprofits, :through => :challenges_nonprofits, :dependent => :destroy
    has_many :sponsors, :through => :challenges_sponsors, :dependent => :destroy
    belongs_to :owner, :class_name => 'User', :foreign_key => "owner_id"
    has_many :team, :class_name => 'User', :through => :challenges_teammembers, :dependent => :destroy
   has_attached_file :challenge_img
   has_attached_file  :img_thumb_url
   accepts_nested_attributes_for :action_stubs, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
