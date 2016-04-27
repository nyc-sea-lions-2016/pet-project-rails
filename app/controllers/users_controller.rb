class UsersController < ApplicationController

  def create
    response = JSON.parse(request.body.string)
    @user = User.find_or_create_by(facebook_id: response["user"]["credentials"]["userId"])
    session[:user_id] = @user.id
  end

  def edit
    @user = User.find_by(id: current_user.id)
  end

  def update
    response = JSON.parse(request.body.string)
    @user = User.find(current_user.id)
    if response["location"]
      @user.update(preferred_location: response["location"])
    end
    if response["animalPreference"]
      @user.update(animal_preference: response["animalPreference"])
    end
  end

  def show
    @pets = User.find(current_user).pets
  end

end
