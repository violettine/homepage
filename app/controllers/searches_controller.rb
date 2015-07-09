class SearchesController < ApplicationController
  def show
    @search = Search.new(params[:search])
    (flash.now[:alert] = 'Did you search for nothing?') if @search.term.empty?
    @result = @search.short_movies
  end
end
