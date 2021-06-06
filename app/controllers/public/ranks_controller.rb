class Public::RanksController < ApplicationController
  before_action :authenticate_user!

  def index
    @post_ranks = Post.rank
    @camp_place_ranks = CampPlace.rank
    @camp_item_ranks = CampItem.rank
  end

end
