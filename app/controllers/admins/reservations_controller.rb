class Admins::ReservationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reservations = Reservation.all.page(params[:page]).per(10).order(id: "DESC")
    @checkout = "11:00"
  end

  def show
    @reservation = Reservation.find(params[:id])
    @checkout = "11:00"
  end
end
