class Nonprofit < ActiveRecord::Base
  has_attached_file :image_full
  has_attached_file  :image_thumb

  has_and_belongs_to_many :challenges
end
