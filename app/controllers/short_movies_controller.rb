class ShortMoviesController < ApplicationController
  def show
    @short_movies = ShortMovie.all
  end

  # def create
  #   @short_movie = ShortMovie.new(short_movies_require)

  #   if @short_movie.save
  #     puts 'Video saved!'
  #   else
  #     puts 'Video not saved!'
  #   end
  # end
  def add

  end

  private

  def short_movies_require
    params.require(:short_movies).permit(:short_movie)
  end
end
