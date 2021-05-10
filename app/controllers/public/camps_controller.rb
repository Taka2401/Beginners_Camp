class Public::CampsController < ApplicationController

  def index
    @camps = Camp.all
  end

  def show
    @camp = Camp.find(params[:id])
  end


end
