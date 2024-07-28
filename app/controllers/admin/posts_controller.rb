class Admin::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @post_comments = @post.post_comments.all.page(params[:page]).per(9)
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :genre_id)
  end

end
