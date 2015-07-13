class ShortMoviesController < ApplicationController
  def show
    @short_movies = ShortMovie.all
  end

  def create
    @short_movie = ShortMovie.new(short_movies_require)
    @short_movie.create_link(@short_movie)
    if @short_movie.save
      flash.now[:success] = 'Thanks for your video!'
    else
      flash.now[:alert] = 'Hey! It seems like the movie already exists in my database!'
    end
  end

  def add
  end

  private

  def short_movies_require
    params.require(:short_movies).permit(:yt_id)
  end
end
