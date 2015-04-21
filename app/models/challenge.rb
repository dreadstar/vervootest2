class Challenge < ActiveRecord::Base
  has_many :action_stubs, :dependent => :destroy

  has_and_belongs_to_many :nonprofits
  has_and_belongs_to_many :sponsors

  belongs_to :owner, :class_name => 'User', :foreign_key => "owner_id"
  has_many :challenge_memberships
  has_many :users, through: :challenge_memberships

  has_attached_file :challenge_img
  has_attached_file  :img_thumb_url
  has_attached_file  :logo_url

  # validates_attachment_content_type :challenge_img, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_content_type :img_thumb_url, :content_type => /\Aimage\/.*\Z/
  # validates_attachment_content_type :logo_url, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :action_stubs, :reject_if => lambda { |a| a[:name].blank? }, :allow_destroy => true
end
