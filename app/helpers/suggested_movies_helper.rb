module SuggestedMoviesHelper
  def sub_link_address(movie)
    # replace watch?v= with embed/ to embed the video
    movie.link.sub!('watch?v=', 'embed/') unless movie.link.match(/embed/)
  end
end
