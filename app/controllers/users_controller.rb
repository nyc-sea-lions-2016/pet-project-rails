class UsersController < ApplicationController

  def edit
    # @user = User.find(params[:id])
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    if @user.update_attributes(user_params)
      # show a message in native (flash)
    else
      # show an error in native?
    end
  end

  def show
    @user = User.includes(:pets).find(current_user)
    @photos = @user.pets.includes(:photos)
    binding.pry
  end

  private

  def user_params
    params.require(:user).permit(:name, :preferences)
  end
end
