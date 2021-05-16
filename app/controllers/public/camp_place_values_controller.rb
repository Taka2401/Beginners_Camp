class Public::CampPlaceValuesController < ApplicationController

  def new
    @camp_place_value = CampPlaceValue.new
    @camp_place = CampPlace.find(params[:camp_place_id])
  end

  def edit
  end

  def create
    camp_place = CampPlace.find(params[:camp_place_id])
    camp_place_value = CampPlaceValue.new
    camp_place_value = current_user.camp_place_values.new(camp_place_value_params)
    camp_place_value.camp_place_id = camp_place.id
        byebug
    camp_place_value.save
    redirect_to camp_place_path(camp_place)
  end

  def update
  end

  def destroy
  end

  private

  def camp_place_value_params
    params.require(:camp_place_value).permit(:rate, :camp_place_id)
  end

end
