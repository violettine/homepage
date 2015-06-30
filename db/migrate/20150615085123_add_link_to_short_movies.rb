class AddLinkToShortMovies < ActiveRecord::Migration
  def change
    add_column :short_movies, :link, :string
    add_index :short_movies, :link
  end
end
