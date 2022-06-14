class RoomsController < ApplicationController
  # ユーザーの登録した部屋一覧
  def index
    @rooms = current_user.rooms
  end
  
  # 部屋詳細、及び予約画面
  def show
    @room = Room.find(params[:id])
    @user = @room.user
  end
  
  # 部屋登録
  def new
    @room = Room.new
    @user = User.find(current_user.id)
  end
  
  # 部屋登録
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "部屋情報を登録しました"
      redirect_to "/rooms/#{@room.id}"
    else
      flash.now[:alert] = "登録できませんでした"
      render "new"
    end
  end
  
  private
   def room_params
     params.require(:room).permit(:name, :introduction, :price, :address, :image, :user_id)
   end
   
end
