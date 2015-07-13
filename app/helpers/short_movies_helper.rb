module ShortMoviesHelper
  def sub_link_address(movie)
    unless movie.link.match(/embed/)
      yt_id = movie.link.match(/\A.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*\z/i)
      yt_id = yt_id[2] if yt_id && yt_id[2]
      movie.link = 'http://www.youtube.com/embed/'+ yt_id
    end
  end
end
