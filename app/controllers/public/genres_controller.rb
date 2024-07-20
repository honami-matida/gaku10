class Public::GenresController < ApplicationController

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
    @posts = @genre.posts
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :introduction)
  end
end
