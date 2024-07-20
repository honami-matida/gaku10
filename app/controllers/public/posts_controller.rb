class Public::PostsController < ApplicationController
  before_action :authenticate_customer!, only: [:new, :show, :edit]
  before_action :is_matching_login_customer, only: [:edit, :update]

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
      flash.now[:notice] = "投稿に失敗しました"
      render :new
    end

  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post = Post.find(params[:id])
    @genre = params[:genres]

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to public_post_path(@post), notice:"更新されました"
    else
      flash.now[:notice] = "更新に失敗しました"
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to profile_public_customer_path(post.customer)
  end

  private

  def post_params
    params.require(:post).permit(:title, :introduction, :genre_id)
  end

  def authenticate_customer!
    unless customer_signed_in?
      flash[:alert] = "ログインが必要です。"
      redirect_to root_path
    end
  end

  def is_matching_login_customer
    customer = Customer.find(params[:id])
    unless customer.id == current_customer.id
      flash[:alert] = "投稿した会員でないので編集できません。"
      redirect_to root_path
    end
  end

end
