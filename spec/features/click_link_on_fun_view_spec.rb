require 'rails_helper'

RSpec.feature('User clicks on short_movie link', type: :feature) do
  scenario 'user clicks link, short movies are loaded' do
    visit 'pages/fun'
    click_link 'short movies'

    expect(page).to find_by_id('div#short_movie')
  end
end
