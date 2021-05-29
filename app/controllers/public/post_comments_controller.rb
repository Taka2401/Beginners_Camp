class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new
    @created_comment = current_user.post_comments.new(post_comment_params)
    @created_comment.post_id = @post.id
    unless @created_comment.save
      render 'error'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post_comment = PostComment.new
    comment = @post.post_comments.find_by(id: params[:id])
    comment.destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
