class Public::CampPlacesController < ApplicationController

  def index
    @camp_places = CampPlace.search(params[:search])
  end

  def show
    @camp_place = CampPlace.find(params[:id])
  end

end
