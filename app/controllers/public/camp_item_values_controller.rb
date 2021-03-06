class Public::CampItemValuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @camp_item = CampItem.find(params[:camp_item_id])
    @camp_items = @camp_item.camp_item_values.page(params[:page]).per(10).order(id: "DESC")
  end

  def show
    @camp_item_value = CampItemValue.find(params[:id])
    @camp_item = CampItem.find(params[:camp_item_id])
  end

  def new
    @camp_item_value = CampItemValue.new
    @camp_item = CampItem.find(params[:camp_item_id])
  end

  def create
    @camp_item = CampItem.find(params[:camp_item_id])
    @camp_item_value = CampItemValue.new(camp_item_value_params)
    @camp_item_value.camp_item_id = @camp_item.id
    @camp_item_value.user_id = current_user.id
    if @camp_item_value.save
      flash[:notice] = "口コミを投稿しました！"
      redirect_to camp_item_path(@camp_item)
    else
      render :new
    end
  end

  def destroy
    @camp_item = CampItem.find(params[:camp_item_id])
    @camp_item_value = CampItemValue.find(params[:id])
    @camp_item_value.destroy
    redirect_to camp_item_path(@camp_item)
  end

  private

  def camp_item_value_params
    params.require(:camp_item_value).permit(:title, :rate, :review)
  end
end
