class Client::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genretraders = Trader.where(genre_id: @genre.id).page(params[:page])
  end
end
