class Admins::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all.order(id: "DESC")
    @checkout = "11:00"
  end

  def show
    @reservation = Reservation.find(params[:id])
    @checkout = "11:00"
  end

end
