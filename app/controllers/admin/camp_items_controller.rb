class Admin::CampItemsController < ApplicationController

  def index
    @camp_items = CampItem.all
  end

  def show
    @camp_item = CampItem.find(params[:id])
  end

  def new
    @camp_item = CampItem.new
  end

  def edit
    @camp_item = CampItem.find(params[:id])
  end

  def create
    @camp_item = CampItem.new(camp_item_params)
    @camp_item.admin_id = current_admin.id
    @camp_item.save
    redirect_to admin_camp_items_path
  end

  def update
    @camp_item = CampItem.find(params[:id])
    @camp_item.update(camp_item_params)
    redirect_to admin_camp_item_path(@camp_item)
  end

  def destroy
    @camp_item = CampItem.find(params[:id])
    @camp_item.destroy
    redirect_to admin_camp_items_path
  end

  private

  def camp_item_params
     params.require(:camp_item).permit(:image, :name, :introduction)
  end

end
