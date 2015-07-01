require 'rails_helper'

RSpec.describe('pages/build', type: :view) do
  it 'displays two divs' do
    render
    assert_select 'div',  count: 2
  end

  it 'displays an ordered list with some list items inside' do
    render
    assert_select 'ol' do
      assert_select 'li', count: 5
    end
  end

  it 'displays five links' do
    render
    assert_select 'a', count: 6
  end
end
