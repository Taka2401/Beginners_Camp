class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :insert_current_user
  before_action :ensure_current_user, only: [:edit, :update]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def post
    @user = User.find(params[:id])
    @post = @user.posts.page(params[:page]).per(10)
  end

  def following
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(10)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(10)
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end

  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:alert] = "※権限がありません"
      redirect_to camps_path
    end
  end

  def insert_current_user
    @guest = current_user.id == 1 && current_user.name == 'ゲスト'
  end
end
