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
    @user = User.find(current_user.id)

    if @user.update(params.require(:user).permit(:image, :name, :introduction))
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to :users_profile
    else
      flash.now[:notice] = "更新できませんでした"
      render "edit"
    end
  end
end
