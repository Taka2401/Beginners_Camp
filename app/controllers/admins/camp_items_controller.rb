class Admins::CampItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @camp_items = CampItem.all.page(params[:page]).per(10).order(id: "DESC")
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
    if @camp_item.save
      redirect_to admins_camp_items_path
    else
      render :new
    end
  end

  def update
    @camp_item = CampItem.find(params[:id])
    if @camp_item.update(camp_item_params)
      redirect_to admins_camp_item_path(@camp_item)
    else
      render :edit
    end
  end

  def destroy
    @camp_item = CampItem.find(params[:id])
    @camp_item.destroy
    redirect_to admins_camp_items_path
  end

  private

  def camp_item_params
    params.require(:camp_item).permit(:image, :name, :introduction)
  end
end
