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
    @pets = User.find(current_user).pets
    # @pets = Pet.includes(:photos).find_by(user_id: current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :preferences)
  end
end
