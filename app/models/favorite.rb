class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  validates :user, :pet, { presence: true }
end
