class Challenge < ActiveRecord::Base
  has_many :action_stubs, :dependent => :destroy

  has_and_belongs_to_many :nonprofits
  has_and_belongs_to_many :sponsors

  belongs_to :owner, :class_name => 'User', :foreign_key => "owner_id"
  has_many :challenge_memberships
  has_many :users, through: :challenge_memberships

  has_attached_file :challenge_img
  has_attached_file  :img_thumb_url

  accepts_nested_attributes_for :action_stubs, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
