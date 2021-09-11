class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Relationship.filter_by_followed(params[:followed_id]).select(:id, :follower_id, :followed_id)
  end

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end
end