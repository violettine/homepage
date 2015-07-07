require 'rails_helper'

RSpec.feature('User clicks link of header', type: :feature) do
  scenario 'User clicks on "Social projects"' do
    visit root_path
    click_link 'Social projects'

    expect(page).to have_text('One world')
  end

    scenario 'User clicks on "Like fun?"' do
    visit root_path
    click_link 'Like fun?'

    expect(page).to have_text('us happy')
  end

    scenario 'User clicks on "Getting into APIs"' do
    visit root_path
    click_link 'Getting into'

    expect(page).to have_text('API stands for')
  end

    scenario 'User clicks on "About me"' do
    visit root_path
    click_link 'About me'

    expect(page).to have_text('ruby developer')
  end
end
