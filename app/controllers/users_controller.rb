class UsersController < ApplicationController

  def edit
    @user = User.find(current_user)
  end

  def update
    binding.pry
    response = JSON.parse(request.body.string)
    User.update(current_user.id, )
  end

  def show
    @pets = User.find(current_user).pets
  end

end
