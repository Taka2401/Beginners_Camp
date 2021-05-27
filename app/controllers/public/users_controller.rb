class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :insert_current_user
  before_action :ensure_current_user, only: [:edit, :update, :show]

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def post
    @user = User.find(params[:id])
    @post = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:alert]="※権限がありません"
      redirect_to camps_path
    end
  end

  # def insert_current_user
  #   @guest = current_user.id == 1 && current_user.name == 'ゲスト'
  # end

end
