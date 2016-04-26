class PreferencesUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :preference

  validates :user, :preference, { presence: true }
end
