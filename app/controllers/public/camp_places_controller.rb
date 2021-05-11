class Public::CampPlacesController < ApplicationController

  def index
    @camp_places = Camp_place.search(params[:search])
  end

  def show
    @camp_place= Camp_place.find(params[:id])
  end

end
