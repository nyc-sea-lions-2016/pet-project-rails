class PreferencesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :preference

  validates :user_id, :preference_id, { presence: true }
end
