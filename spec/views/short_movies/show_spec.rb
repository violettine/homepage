require 'rails_helper'

RSpec.describe('short_movies/show', type: :view) do
  it 'displays a h1 header' do
    @short_movies = ShortMovie.all
    render
    assert_select 'h1'
  end
end
