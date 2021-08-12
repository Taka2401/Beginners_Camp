class Public::CampItemsController < ApplicationController
  def index
    @camp_items = CampItem.all.page(params[:page]).per(8)
  end

  def show
    @camp_item = CampItem.find(params[:id])
  end
end
