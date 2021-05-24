class Admins::ReservationsController < ApplicationController

  def index
    @reservations = Reservation.all
  end

  def show
  end

end
