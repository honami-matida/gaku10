class Public::PostsController < ApplicationController

  def new
    @post = Post.new
    @genre = params[:genres]
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to public_post_path(@post)
    else
      render :new
    end

  end

  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    @genre = params[:genres]
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to public_post_path(post), notice:"更新されました"
    else
      flash.now[:notice] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :genre_id)
  end

end
