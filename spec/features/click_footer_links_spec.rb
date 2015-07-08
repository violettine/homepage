require 'rails_helper'

RSpec.describe('User clicks link of footer', type: :feature) do
  scenario 'User clicks on Back to Construction Area' do
    visit 'pages/personal'
    click_link 'Back to Construction Area'

    expect(page).to have_text('main purpose')
  end
end
