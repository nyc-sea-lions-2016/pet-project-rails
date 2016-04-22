class Pet < ActiveRecord::Base
	has_many users, through: favorites
	has_many :photos

	validates :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs, :contact_city, :contact_zip, :contact_state, :contact_name, :contact_email, :contact_phone, { presence: true }
end
