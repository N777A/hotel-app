class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    
  end 

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :count_ppl, :user_id, :room_id, :payment))
    if @reservation.save
      redirect_to reservations_path
    else
      render :confirm
    end
  end

  def confirm
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :count_ppl, :user_id, :room_id))
    @room_id = @reservation.room_id
    @room = Room.find(@room_id)

    if @reservation.validate(:before_confirm)
    @days = (@reservation.checkout - @reservation.checkin).to_i 
    @total_fee = @room.fee * @reservation.count_ppl * @days  
    else
      @reservation.errors
      flash.now[:reservation_error] = @reservation.errors.full_messages.join(" ")
      render "rooms/show"
    end



    
    

  end
end


