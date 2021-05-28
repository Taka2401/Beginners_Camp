class Public::CampPlaceValuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @camp_place = CampPlace.find(params[:camp_place_id])
    @camp_places = @camp_place.camp_place_values.page(params[:page]).per(10)
  end

  def show
    @camp_place_value = CampPlaceValue.find(params[:id])
  end

  def new
    @camp_place_value = CampPlaceValue.new
    @camp_place = CampPlace.find(params[:camp_place_id])
  end

  def create
    @camp_place = CampPlace.find(params[:camp_place_id])
    @camp_place_value = CampPlaceValue.new
    @camp_place_value = current_user.camp_place_values.new(camp_place_value_params)
    @camp_place_value.camp_place_id = @camp_place.id
    @camp_place_value.save
    redirect_to camp_place_path(@camp_place)
  end

  private

  def camp_place_value_params
    params.require(:camp_place_value).permit(:camp_place_id, :title, :review, :rate)
  end
end
