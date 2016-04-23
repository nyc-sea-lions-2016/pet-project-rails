class Pet < ActiveRecord::Base
	has_many :favorites
	has_many :photos
	has_many :users, through: :favorites
	after_initialize :init

	validates :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :contact_city, :contact_zip, :contact_state, :contact_name, :contact_email, :contact_phone, { presence: true }


# init validates everything but petfinder_id & animal(type) & images
	def init
		self.name ||= "Please give me a name and a home!"
		self.description ||= "No description given"
		self.age ||= "No age listed"
		self.size ||= "No size listed"
		self.gender ||= "No gender listed"
		self.breed ||= "No breed listed"
		self.special_needs ||= "No records of any special needs"
		self.contact_city ||= "No contact city on record"
		self.contact_state ||= "No contact state on record"
		self.contact_zip ||= "No contact zip code on record"
		self.contact_name ||= "No contact name on record"
		self.contact_email ||= "No contact email address on record"
		self.contact_phone ||= "No contact phone number on record"
	end
end
