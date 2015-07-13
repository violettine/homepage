class CreateSuggestedMovies < ActiveRecord::Migration
  def change
    create_table :suggested_movies do |t|
      t.string :link
      t.string :title

      t.timestamps null: false
    end
  end
end
