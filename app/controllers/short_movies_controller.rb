class ShortMoviesController < ApplicationController
  def show
    @short_movies = ShortMovie.all
  end

  def create
    @short_movie = ShortMovie.new(short_movies_require)
    @short_movie.create_link(@short_movie)
    if @short_movie.save
      flash.now[:success] = 'Thanks for your short movie!'
    else
      flash.now[:alert] = 'Hey! Change bug alert here!!'
    end
  end

  def add
  end

  def suggest
  end

  def suggest_to_db
    @suggested_movie = SuggestedMovie.new(suggested_movies_require)
    if @suggested_movie.save
      flash.now[:success] = 'Thanks for your suggestion!'
    else
      flash.now[:error] = 'Something happened, please try again!'
    end
  end

  private

  def short_movies_require
    params.require(:short_movies).permit(:yt_id, :short_movie)
  end

  def suggested_movies_require
    params.require(:suggested_movies).permit(:link, :title)
  end
end
