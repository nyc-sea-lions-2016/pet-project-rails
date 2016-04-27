class User < ActiveRecord::Base
  has_many :favorites
  has_many :pets, through: :favorites

  validates :facebook_id, presence: true
end
