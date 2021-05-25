class Public::ReservationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @checkout = "11:00"
  end

  def new
    @camp_place = CampPlace.find(params[:camp_place_id])
    @reservation = Reservation.new
    @checkout = "11:00"
  end

  def confirm
    @camp_place = CampPlace.find(params[:camp_place_id])
		@reservation = Reservation.new
		@reservation.user_id = current_user.id
		@reservation.guest =  params[:reservation][:guest]
		@reservation.start_date =  params[:reservation][:start_date]
		@reservation.payment_method = params[:reservation][:payment_method]

		@checkout = "11:00"
  end

  def create
    @camp_place = CampPlace.find(params[:camp_place_id])
    @reservation = Reservation.new(reservation_params)
    reservation = current_user.reservations.new(reservation_params)
    reservation.camp_place_id = @camp_place.id
    reservation.save
    redirect_to camps_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:camp_place_id, :start_date, :total_fee, :guest, :payment_method)
  end

end
