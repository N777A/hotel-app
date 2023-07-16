class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def index_myrooms

  end

  def show

  end

  def new
    @room = Room.new
    @user = current_user
  end

  def create
    @room = Room.new(params.require(:room).permit(:name, :intro, :fee, :address, :image, :user_id))
    if @room.save
      flash[:room_notice] = '施設の新規登録をしました'
      redirect_to new_room_url
    else
      render home_top_path
    end
  end

  
end
