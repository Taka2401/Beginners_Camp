class Public::CampPlacesController < ApplicationController

  def index
    @camp_places = Camp_place.all
  end

  def show
    @camp_place= Camp_place.find(params[:id])
  end
end
