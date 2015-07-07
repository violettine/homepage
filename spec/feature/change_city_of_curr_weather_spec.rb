require 'rails_helper'

RSpec.feature('Change city for current weather', type: :feature) do
  scenario 'User changes city name for current weather' do
    visit 'api/index'

    fill_in 'curr[city]', with: 'Kiel'
    click_button 'commit_curr'

    expect(page).to have_text('Kiel')
  end
end
