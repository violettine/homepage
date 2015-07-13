class SearchesController < ApplicationController
  def show
    @search = Search.new(params[:search])
    @result = @search.short_movies
    (flash.now[:alert] = 'Could not find anything..') if @result.empty?
  end
end
