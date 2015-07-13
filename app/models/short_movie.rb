class ShortMovie < ActiveRecord::Base
  validates :yt_id, presence: true, uniqueness: true

  def create_link(movie)
    movie.link = 'https://www.youtube.com/embed/'+ movie.yt_id
  end
end
