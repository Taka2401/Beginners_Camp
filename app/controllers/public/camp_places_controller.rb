class Public::CampPlacesController < ApplicationController
  def index
    @camp_places = CampPlace.search(params[:search]).page(params[:page]).per(8)
  end

  def show
    @user = User.find(params[:id])
    @camp_place = CampPlace.find(params[:id])
    @reservation = Reservation.new
  end
end
