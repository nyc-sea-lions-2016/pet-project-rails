class UsersController < ApplicationController

  def create
    response = JSON.parse(request.body.string)
    facebook_id = response["user"]["credentials"]["userId"]
    profile_pic = response["user"]["photo"]["url"]
    token = response["user"]["credentials"]["token"]
    name = response["user"]["info"]["name"]
    email = response["user"]["info"]["email"]
    preferred_location = response["user"]["preferred_location"]
    @user = User.find_by(facebook_id: response["user"]["credentials"]["userId"])
    if @user
      @user.preferred_location = preferred_location
    else
      @user = User.create(facebook_id: facebook_id, profile_pic: profile_pic, token: token, name: name, email: email, preferred_location: preferred_location)
    end
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
      response["animalPreference"] == 'none' ? @user.update(animal_preference: '') : @user.update(animal_preference: response["animalPreference"])
    end
  end

  def show
    @pets = User.find(current_user).pets
  end

end
