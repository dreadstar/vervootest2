class Challenge < ActiveRecord::Base
    has_many :actions
    has_many :nonprofits, :through => :challenges_nonprofits
    has_many :sponsors, :through => :challenges_sponsors
    belongs_to :owner, :class_name => 'User', :foreign_key => "owner_id"
    has_many :team, :class_name => 'User', :through => :challenges_teammembers
end
