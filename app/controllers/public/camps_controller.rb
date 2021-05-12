class Public::CampsController < ApplicationController

  def index
    @posts = Post.all
    @camp_places = Camp_place.all
    @camp_items = Camp_item.all
  end

  def show
    @camp_place= Camp_place.find(params[:id])
  end


end
