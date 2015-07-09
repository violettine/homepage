require 'rails_helper'

RSpec.feature('User clicks on short_movie link', type: :feature) do
  before do
    @short_movies = 'https://www.youtube.com/embed/Gq0jfzgvvrM'
  end
  scenario 'user clicks link, short movies are loaded' do
    visit 'pages/fun'
    click_link 'short movies'
    save_and_open_page
    expect(page).to have_css('#short_movie')
  end
end

# i am in a feature test, i want to load the whole page.
# to get the movie divs loaded i have to init @short_movies and then give it to the view
# but dont get it loaded the instance show is called(so when the link is clicked)?
