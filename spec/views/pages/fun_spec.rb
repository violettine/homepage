require 'rails_helper'

RSpec.describe('pages/fun', type: :view) do
  it 'has a h1 header' do
    render
    assert_select 'h1'
  end

  it 'renders short_movies template' do
    render
    expect(rendered).to match(/short movies/)
  end
end
