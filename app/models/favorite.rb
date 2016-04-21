class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :pet

  validates :user_id, :pet_id, { presence: true }
end
