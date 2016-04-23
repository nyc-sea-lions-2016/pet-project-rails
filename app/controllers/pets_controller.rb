class PetsController < ApplicationController

	def create
		@pet = Pet.new(pet_params)
		if @pet.save
			favorite = Favorite.create(pet_id: @pet.id, user_id: 1)
		end
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def delete
		@pet = Pet.find(params[:id])
		@pet.delete
	end

	private

	def pet_params
		params.require(:pet).permit(:petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs, :contact_city, :contact_zip, :contact_state, :contact_name, :contact_email, :contact_phone)
	end

end
