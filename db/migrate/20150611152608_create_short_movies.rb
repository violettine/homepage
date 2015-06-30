class CreateShortMovies < ActiveRecord::Migration
  def change
    create_table :short_movies do |t|
      t.string :short_movie

      t.timestamps null: false
    end
  end
end
