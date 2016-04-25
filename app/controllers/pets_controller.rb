class PetsController < ApplicationController

	def create
		response = JSON.parse(request.body.string)
		photos = response["pet"]["photos"]
		response["pet"].delete('photos')
		@pet = Pet.new(response["pet"])
		if @pet.save
			favorite = Favorite.create(pet_id: @pet.id, user_id: current_user.id)
			photos.each do |photo|
				photo = Photo.create({url: photo["url"], pet_id: @pet.id})
			end
		end
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def delete
		@pet = Pet.find(params[:id])
		@pet.delete
		delete_favorites(params[:id], current_user.id)
		delete_photos(params[:id])
	end

	private

	def delete_favorites(pet_id, user_id)
		Favorite.find_by(pet_id: pet_id, user_id: user_id).destroy
	end

	def delete_photos(pet_id)
		unless Favorite.find_by(pet_id: pet_id)
			Photo.where(pet_id: pet_id).destroy_all
		end
	end

end
