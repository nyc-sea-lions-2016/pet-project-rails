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

	def destroy
		pet_id = JSON.parse(request.body.string)["petID"]
		pet = Pet.find(params[:id])
		if Favorite.where(pet_id: pet_id).length > 1
			delete_favorites(pet_id, current_user.id)
		else
			pet.destroy
			delete_favorites(pet_id, current_user.id)
			delete_photos(pet_id)
		end
	end

	private

	def delete_favorites(pet_id, user_id)
		Favorite.find_by(pet_id: pet_id, user_id: user_id).destroy
	end

	def delete_photos(pet_id)
		Photo.where(pet_id: pet_id).destroy_all
	end

end
