class Public::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @posts = @genre.posts.page(params[:page]).per(9)
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :introduction)
  end
end
