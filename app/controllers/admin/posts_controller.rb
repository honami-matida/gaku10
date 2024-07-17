class Admin::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :genre_id)
  end

end
