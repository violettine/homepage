class Search
  attr_reader :term
  attr_reader :result
  def initialize(params = {})
    @term = params.fetch(:term, '')
  end

  def short_movies
    ShortMovie.where('short_movie LIKE ?', "%#{term}%").first || ShortMovie.last
  end
end
