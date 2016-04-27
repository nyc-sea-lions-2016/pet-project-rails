class Pet < ActiveRecord::Base
	has_many :favorites
	has_many :photos
	has_many :users, through: :favorites
	after_initialize :init

	validates :petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :contact_city, :contact_zip, :contact_state, :contact_address, :contact_email, :contact_phone, { presence: true }

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
		self.contact_address ||= "No contact address on record"
		self.contact_email ||= (find_email(self.description) || "No contact email address on record")
		self.contact_phone ||= (find_phone_number(self.description) || "No contact phone number on record")
	end

	def find_phone_number(description)
		description.match(/\d{3}-\d{3}-\d{4}/).to_s
	end

	def find_email(description)
		description.match(/\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}\b/).to_s
	end
end
