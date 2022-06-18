class ReservationsController < ApplicationController
  # 全予約一覧
  def index
    @reservations = Reservation.all
  end
  
  # 予約後の確認
  def show
    @reservation = Reservation.find(params[:id])
    @room = @reservation.room
    
    @day_used    = (@reservation.end_day - @reservation.start_day).to_i
    @total_price = @room.price * @day_used * @reservation.number_of_people
  end
  
  # 予約作成、confirm後
  def create
    @reservation = Reservation.new(reservation_params)
    @room = @reservation.room
    @reservation.save
    redirect_to "/reservations/#{@reservation.id}"
  end
  
  # 予約確認、rooms#showの後のリンク先
  def confirm
    
    @reservation = Reservation.new(reservation_params)
    @room        = @reservation.room
    @user        = @room.user
    
    # 開始日、終了日、人数の入力必須
    if @reservation.invalid?
      render "rooms/show"
    else
      @day_used    = (@reservation.end_day - @reservation.start_day).to_i
      @total_price = @room.price * @day_used * @reservation.number_of_people
    end
  end
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:start_day, :end_day, :number_of_people, :user_id, :room_id)
  end
end
