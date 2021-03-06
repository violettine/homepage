require 'rails_helper'

RSpec.describe('pages/personal', type: :view) do
  it 'displays a h1 header' do
    render
    assert_select 'h1'
  end

  it 'displays one link' do
    render
    assert_select 'a', count: 1
  end
end
