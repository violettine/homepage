require 'rails_helper'

RSpec.describe('fun_page/index', type: :view) do
  it 'has a header' do
    render
    assert_select 'h1'
  end

  it 'renders short_movies template' do
    render
    expect(rendered).to match(/Movies/)
  end
end
