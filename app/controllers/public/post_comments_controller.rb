class Public::PostCommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    post_comment = PostComment.new(post_comment_params)
    post_comment.customer_id = current_customer.id
    post_comment.post_id = post.id
    post_comment.save
    redirect_to public_post_path(post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_comment = PostComment.find(params[:id])
    post_comment.destroy
    redirect_to public_post_path(@post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
