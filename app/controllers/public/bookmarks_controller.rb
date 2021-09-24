class Public::BookmarksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @bookmarks = CampPlace.where(id: @user.bookmarks.pluck(:Camp_place_id)).page(params[:page]).per(8).order(id: "DESC")
  end

end
