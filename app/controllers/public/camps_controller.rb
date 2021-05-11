class Public::CampsController < ApplicationController

  def index
    @camp_places = Camp_place.all
    @posts = Post.all
  end

  def show
    @camp_place= Camp_place.find(params[:id])
  end


end
