class Search
  attr_reader :term
  attr_reader :result
  def initialize(params = {})
    @term = params.fetch(:term, '')
  end

  def short_movies
     ShortMovie.find_by_short_movie(term) || ShortMovie.last
  end
end
