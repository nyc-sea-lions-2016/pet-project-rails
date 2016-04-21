class Preference < ActiveRecord::Base
  has_many :preferences_users
  has_many :users, through: :preferences_users
end
