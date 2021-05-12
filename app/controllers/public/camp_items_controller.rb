class Public::CampItemsController < ApplicationController

  def index
    @camp_items = Camp_item.all
  end

  def show
    @camp_item = Camp_item.find(params[:id])
  end
end
