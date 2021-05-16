class Public::CampPlacesController < ApplicationController

  def index
    @camp_places = CampPlace.search(params[:search])
    CampPlace.includes([:post_images])
  end

  def show
    @camp_place = CampPlace.find(params[:id])
  end

end
