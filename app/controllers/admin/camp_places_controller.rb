class Admin::CampPlacesController < ApplicationController

  def index
    @camp_places = Camp_place.all
  end

  def show
    @camp_place = Camp_place.find(params[:id])
  end

  def new
    @camp_place = Camp_place.new
  end

  def edit
    @camp_place = Camp_place.find(params[:id])
  end

  def create
    @camp_place = Camp_place.new(camp_place_params)
    @camp_place.admin_id = current_admin.id
    @camp_place.save
    redirect_to admin_camp_places_path
  end

  def update
    @camp_place = Camp_place.find(params[:id])
    @camp_place.update(camp_place_params)
    redirect_to admin_camp_place_path(@camp_place)
  end

  def destroy
    @camp_place = Camp_place.find(params[:id])
    @camp_place.destroy
    redirect_to admin_camp_places_path
  end

  private

  def camp_place_params
     params.require(:camp_place).permit(:image, :name, :address, :introduction)
  end

end
