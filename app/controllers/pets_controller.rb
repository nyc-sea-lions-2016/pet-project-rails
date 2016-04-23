class PetsController < ApplicationController

	def create
		binding.pry
		@pet = Pet.new(pet_params)
		@photo = Photo.new({url: params[:url], pet_id: @pet.id})
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
		delete_favorites(params[:id], 1)
		delete_photos(params[:id])
	end

	private

	def pet_params
		params.require(:pet).permit(:petfinder_id, :name, :animal, :description, :age, :size, :gender, :breed, :altered, :shots, :special_needs, :contact_city, :contact_zip, :contact_state, :contact_name, :contact_email, :contact_phone)
	end

	def delete_favorites(pet_id, user_id)
		Favorite.find_by(pet_id: pet_id, user_id: user_id).destroy
	end

	def delete_photos(pet_id)
		unless Favorite.find_by(pet_id: pet_id)
			Photo.where(pet_id: pet_id).destroy_all
		end
	end

end
