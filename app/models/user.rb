class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
         #:recoverable, :rememberable, :trackable, :validatable

  has_many :challenge_memberships
  has_many :challenges, through: :challenge_memberships
end
