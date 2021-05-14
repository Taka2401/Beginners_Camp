class Public::CampsController < ApplicationController

  def index
    @posts = Post.all
    @camp_places = CampPlace.all
    @camp_items = CampItem.all
  end

  def show
    @camp_place= CampPlace.find(params[:id])
  end


end
