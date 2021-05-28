class Public::RanksController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(3).pluck(:post_id))
    @camp_place_ranks = CampPlace.find(CampPlaceValue.group(:camp_place_id).order('avg(rate) desc').limit(3).pluck(:camp_place_id))
    @camp_item_ranks = CampItem.find(CampItemValue.group(:camp_item_id).order('avg(rate) desc').limit(3).pluck(:camp_item_id))
  end
end
