class Public::CampItemsController < ApplicationController

  def index
    @camp_items = CampItem.all
  end

  def show
    @camp_item = CampItem.find(params[:id])
  end
end
