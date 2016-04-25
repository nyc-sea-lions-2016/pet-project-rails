class User < ActiveRecord::Base
  has_many :favorites
  has_many :pets, through: :favorites
  has_many :preferences_users
  has_many :preferences, through: :preferences_users
  
  validates :name, presence: true
end
