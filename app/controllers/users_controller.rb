class UsersController < ApplicationController

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

end
