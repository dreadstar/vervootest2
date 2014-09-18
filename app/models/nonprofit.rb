class Nonprofit < ActiveRecord::Base
  has_attached_file :img
  has_attached_file  :thumb

  has_and_belongs_to_many :challenges
end
