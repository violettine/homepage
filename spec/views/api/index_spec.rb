require 'rails_helper'

RSpec.describe('api/index', type: :view) do
  curr = {}
  curr['name'] = 'kiel'
  curr['clouds'] = {'all'=> 40}
  curr['main'] = {'temp' => 291.18, 'pressure' => 1016, 'humidity' => 68, 'temp_min' => 290.93, 'temp_max'=> 292.04}
  fore = {}
  fore['city'] ={ 'id'=> 2891122, 'name'=> 'Kiel'}

  it 'displays a h1 header' do
    assign(:curr_data, curr)
    assign(:forecast_data, fore)
    render
    assert_select 'h1'
  end

  it 'renders level 1 successfully' do
    assign(:curr_data, curr)
    assign(:forecast_data, fore)
    render
    assert_select 'ol', count: 2
  end
end
