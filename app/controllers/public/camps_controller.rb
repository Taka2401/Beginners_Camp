class Public::CampsController < ApplicationController
  def index
    @camp_items = CampItem
    @camp_places = CampPlace
    @posts = Post.order(id: "DESC")
    @tags = Tag.joins(:tag_relationships).group(:tag_id).order('count(post_id) desc')
  end
end
