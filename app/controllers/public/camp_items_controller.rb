class Public::CampItemsController < ApplicationController

  def index
    @camp_items = CampItem.search(params[:search])
  end

  def show
    @camp_item = CampItem.find(params[:id])
  end
end
