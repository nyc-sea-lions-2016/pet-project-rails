class UsersController < ApplicationController


  def show
    # find favorites with user_id
    # find pets for those favorites
    # set pets to array
    # for when we have current_user method
    @user = User.includes(:pets).find(current_user)

  end
end
