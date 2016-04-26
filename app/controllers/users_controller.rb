class UsersController < ApplicationController

  CURRENT_USER = User.first

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
    @pets = User.find(CURRENT_USER).pets
  end

end
