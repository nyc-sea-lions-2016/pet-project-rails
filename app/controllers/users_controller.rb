class UsersController < ApplicationController

  CURRENT_USER = User.first

  def create
    response = JSON.parse(request.body.string)
    @user = User.find_or_create_by(facebook_id: response["user"]["credentials"]["userId"])
  end

  def edit
    @user = User.find_by(id: CURRENT_USER.id)
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
    @pets = User.find(CURRENT_USER.id).pets
  end

end
