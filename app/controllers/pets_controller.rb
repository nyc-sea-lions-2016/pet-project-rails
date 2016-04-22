class PetsController < ApplicationController

	def create
		# This may not work, we'll dig around later
		@pet = Pet.create(params[:pet])
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def delete
		@pet = Pet.find(params[:id])
		@pet.delete
	end
end