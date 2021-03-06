class Admins::CampPlacesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @camp_places = CampPlace.all.page(params[:page]).per(10).order(id: "DESC")
  end

  def show
    @camp_place = CampPlace.find(params[:id])
  end

  def new
    @camp_place = CampPlace.new
  end

  def edit
    @camp_place = CampPlace.find(params[:id])
  end

  def create
    @camp_place = CampPlace.new(camp_place_params)
    @camp_place.admin_id = current_admin.id
    if @camp_place.save
      redirect_to admins_camp_places_path
    else
      render :new
    end
  end

  def update
    @camp_place = CampPlace.find(params[:id])
    if @camp_place.update(camp_place_params)
      redirect_to admins_camp_place_path(@camp_place)
    else
      render :edit
    end
  end

  def destroy
    @camp_place = CampPlace.find(params[:id])
    @camp_place.destroy
    redirect_to admins_camp_places_path
  end

  private

  def camp_place_params
    params.require(:camp_place).permit(:image, :name, :address, :introduction, :fee, post_images_images: [])
  end
end
