require 'rails_helper'

RSpec.feature('Change city for forecast weather', type: :feature) do
  scenario 'City name changes for forecast weather' do
    visit 'api/index'

    fill_in 'forecast[city]', with: 'Kiel'
    click_button 'commit_fore'

    expect(page).to have_text('Kiel')
  end

  scenario('Highchart gets loaded, so no JavaScript errors', js: true) do
    visit 'http://localhost:3000/api/index'
    expect(page).not_to have_errors
  end
end
