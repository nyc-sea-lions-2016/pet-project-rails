class UsersController < ApplicationController
  def show
    # find favorites with user_id
    # find pets for those favorites
    # set pets to array
    @favorites = Favorite.all

  end
end
