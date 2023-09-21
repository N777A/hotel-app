class ReservationsController < ApplicationController
  
  def index
    @reservations = current_user.reservations.includes(:room)
  end

  def create
    @reservation = Reservation.new(create_params)
    if @reservation.save
      redirect_to reservations_index_path
    else
      render :confirm
    end
  end

  def confirm
    @reservation = Reservation.new(confirm_params)
    @room_id = @reservation.room_id
    @room = Room.find(@room_id)

    if @reservation.validate(:before_confirm)
      @days = (@reservation.checkout - @reservation.checkin).to_i 
      @total_fee = @room.fee * @reservation.count_ppl * @days  
    else
      flash.now[:reservation_error] = @reservation.errors.full_messages.join(" ")
      render "rooms/show"
    end    
  end

  private
  def create_params
    params.require(:reservation).permit(:checkin, :checkout, :count_ppl, :user_id, :room_id, :payment)
  end

  def confirm_params
    params.require(:reservation).permit(:checkin, :checkout, :count_ppl, :user_id, :room_id)
  end
end


