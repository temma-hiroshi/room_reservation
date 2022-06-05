class UsersController < ApplicationController
  
  # edit,showアクションはログイン中のみアクセス可能
  before_action :authenticate_user!, only: [:show, :edit]
  
  # /users/account
  def show
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
      flash.now[:alert] = "更新できませんでした"
      render "edit"
    end
  end
end
