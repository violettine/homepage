module ShortMoviesHelper
  def sub_link_address(movie)
    unless movie.link.match(/embed/)
      # replace watch?v= with embed/ to embed the video
      movie.link.sub!('watch?v=', 'embed/')
    end
  end
end
