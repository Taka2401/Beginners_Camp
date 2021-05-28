class Public::TagsController < ApplicationController

  def index
    @tags = Tag.page(params[:page]).per(20)
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(10)
  end

end
