class Photo < ActiveRecord::Base
	belongs_to :pet

	validates :pet, :url, presence: true
end
