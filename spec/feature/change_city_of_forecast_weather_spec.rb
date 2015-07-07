require 'rails_helper'

RSpec.feature('Change city for forecast weather', type: :feature) do
  scenario 'User changes city name for forecast weather' do
    visit 'api/index'

    fill_in 'forecast[city]', with: 'Kiel'
    click_button 'commit_fore'

    expect(page).to have_text('Kiel')
    expect(page).to match(/highcharts/)
  end
end
