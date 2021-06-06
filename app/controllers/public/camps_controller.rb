class Public::CampsController < ApplicationController
  def index
    @camp_items = CampItem.all
    @camp_places = CampPlace.all
    @posts = Post.all.order(id: "DESC")
    @tags = Tag.joins(:tag_relationships).group(:tag_id).order('count(post_id) desc')
  end

  def show
    @camp_place = CampPlace.find(params[:id])
  end
end
