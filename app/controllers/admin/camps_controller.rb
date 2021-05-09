class Admin::CampsController < ApplicationController

  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find(params[:id])
  end

  def new
    @camp = Camp.new
  end

  def edit
    @camp = Camp.find(params[:id])
  end

  def create
    @camp = Camp.new(camp_params)
    @camp.admin_id = current_admin.id
    @camp.save
    redirect_to admin_camps_path
  end

  def update
    @camp = Camp.find(params[:id])
    @camp.update(camp_params)
    redirect_to admin_camp_path(@camp)
  end

  def destroy
    @camp = Camp.find(params[:id])
    @camp.destroy
    redirect_to admin_camps_path
  end

  private

  def camp_params
     params.require(:camp).permit(:image, :name, :address, :introduction)
  end

end
