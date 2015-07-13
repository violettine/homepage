class Search
  attr_reader :term
  def initialize(params = {})
    @term = params.fetch(:term, '')
  end

  def short_movies
    (ShortMovie.where('short_movie LIKE ?', "%#{term}%")).to_a
  end
end
