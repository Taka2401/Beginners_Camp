class Public::TagsController < ApplicationController
  def index
    @tags = Tag.joins(:tag_relationships).group(:tag_id).page(params[:page]).per(20).order('count(post_id) desc')
  end

  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts.page(params[:page]).per(10)
  end
end
