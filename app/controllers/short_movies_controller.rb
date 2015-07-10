class ShortMoviesController < ApplicationController
  def show
    @short_movies = ShortMovie.all
  end

  def create
    @short_movie = ShortMovie.new(short_movies_require)
    if @short_movie.save
      flash.now[:success] = 'Thanks for your video!'
    else
      flash.now[:alert] = 'Something went wrong..!'
    end
  end

  def add
  end

  private

  def short_movies_require
    params.require(:short_movies).permit(:link)
  end
end
