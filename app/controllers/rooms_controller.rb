class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def own
    @rooms = Room.where(user_id: current_user.id)
  end

  def show
    @room = Room.find(params[:id])
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :intro, :fee, :address, :image, :user_id))
    if @room.save
      flash[:room_notice] = '施設の新規登録をしました'
      redirect_to new_room_url
    else
      flash.now[:room_alert] = '施設を登録できませんでした'
      render :new
    end
  end

  
end
