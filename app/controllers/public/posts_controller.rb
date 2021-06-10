class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @posts = Post.page(params[:page]).per(10).order(id: "DESC")
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    tag_list = params[:post][:tag_ids].split(',')
    if @post.save
      flash[:notice] = "投稿しました！"
      @post.save_tags(tag_list)
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:image, :post_image, :title, :review, :tag_list)
  end
end
