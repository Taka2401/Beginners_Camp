class Public::CampsController < ApplicationController
  def index
    @posts = Post.all
    @camp_places = CampPlace.all
    @camp_items = CampItem.all
    @tags = Tag.joins(:tag_relationships).group(:tag_id).order('count(post_id) desc')
  end

  def show
    @camp_place = CampPlace.find(params[:id])
  end
end
