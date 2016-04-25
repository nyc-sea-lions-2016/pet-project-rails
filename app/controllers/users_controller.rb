class UsersController < ApplicationController

  def create
    response = JSON.parse(request.body.string)
    binding.pry
    @user = User.find_or_create_by(facebook_id: response["user"]["credentials"]["userId"])
  end

  def edit
    @user = User.find(current_user)
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
