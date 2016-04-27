class UsersController < ApplicationController

  def create
    response = JSON.parse(request.body.string)
    @user = User.find_or_create_by(facebook_id: response["user"]["credentials"]["userId"])
    @user.preferred_location = response["user"]["preferred_location"]
    @user.token = response["user"]["credentials"]["token"]
    @user.profile_pic = response["user"]["photo"]["url"]
    @user.name = response["user"]["info"]["name"]
    @user.email = response["user"]["info"]["email"]
    @user.save
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
    if response["searchRadius"]
      @user.update(preferred_search_radius: response["searchRadius"].to_i)
    end
  end

  def show
    @pets = User.find(current_user).pets
  end

end
