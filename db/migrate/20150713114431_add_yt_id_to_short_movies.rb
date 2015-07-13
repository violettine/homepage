class AddYtIdToShortMovies < ActiveRecord::Migration
  def change
    add_column :short_movies, :yt_id, :string
  end
end
