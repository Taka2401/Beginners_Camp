class Public::CampPlaceValuesController < ApplicationController

  def new
    @Camp_place_value = CampPlaceValue.new
  end

  def edit
  end

  def create
    @Camp_place_value = CampPlace.new(camp_place_params)
    @Camp_place_value.user_id = current_user.id
    @Camp_place_value.save
    redirect_to camps_path
  end

  def update
  end

  def destroy
  end

  private

  def camp_place_params
     params.require(:camp_place_value).permit(:rate)
  end

end
