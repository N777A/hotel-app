class RoomsController < ApplicationController
  before_action :set_q, only: [:index, :top, :search]
  def own
    @rooms = Room.where(user_id: current_user.id)
  end

  def top

  end

  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
    @user = current_user
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(create_params)
    if @room.save
      flash[:room_notice] = '施設の新規登録をしました'
      redirect_to room_path(@room)
    else
      flash.now[:room_alert] = '施設を登録できませんでした'
      render :new
    end
  end

  def search
    @results = @q.result
    @sum_rooms = @results.count
  end

  private
  def set_q
    @q = Room.ransack(params[:q])
  end
  
  def create_params
    params.require(:room).permit(:name, :intro, :fee, :address, :image, :user_id)
  end
end
