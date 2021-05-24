class Public::CampItemValuesController < ApplicationController

  def index
    @camp_item = CampItem.find(params[:camp_item_id])
  end

  def show
    @camp_item_value = CampItemValue.find(params[:id])
  end

  def new
    @camp_item_value = CampItemValue.new
    @camp_item = CampItem.find(params[:camp_item_id])
  end

  def create
    camp_item = CampItem.find(params[:camp_item_id])
    camp_item_value = CampItemValue.new
    camp_item_value = current_user.camp_item_values.new(camp_item_value_params)
    camp_item_value.camp_item_id = camp_item.id
    camp_item_value.save
    redirect_to camp_item_path(camp_item)
  end

 private

  def camp_item_value_params
    params.require(:camp_item_value).permit(:camp_item_id, :rate, :title, :review)
  end

end
