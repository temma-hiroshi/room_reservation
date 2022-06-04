class UsersController < ApplicationController
  # /users/account
  def show
  end
  
  def update
  end
  
  # /users/profile,GET
  def edit
    @user = User.find(current_user.id)
  end
  
  # /users/profile,PATCH
  def update
  end
end
