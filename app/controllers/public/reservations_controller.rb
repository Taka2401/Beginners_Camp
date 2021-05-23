class Public::ReservationsController < ApplicationController

  def create
    @camp_place = CampPlace.find(params[:camp_place_id])
    @reservation = Reservation.new
    reservation = current_user.reservations.new(reservation_params)
    reservation.camp_place_id = @camp_place.id
    reservation.save
    redirect_to camps_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end

end
