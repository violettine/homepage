require 'rails_helper'

RSpec.describe(CurrWeatherHelper, type: :helper) do
  curr = {}

  describe '#curr_city' do
    it 'returns the city name' do
      curr['name'] = 'Kiel'

      expect(helper.curr_city(curr)).to eql('Kiel')
    end
  end

  describe '#temperature' do
    it 'returns the teperature' do
      curr['main'] = {'temp' => 291.18}

      expect(helper.temperature(curr)).to eql(18.0)
    end
  end

  describe '#cloud_view' do
    it 'returns the sky is clear' do
      curr['clouds'] = {'all'=> 0}
      expect(helper.cloud_view(curr)).to eql('sky is clear')
    end

    it 'returns the sky is not clear' do
      curr['clouds'] = {'all'=> 40}
      expect(helper.cloud_view(curr)).to eql('sky is not clear')
    end
  end

  describe '#weather_pic' do
    it 'returns weather picture' do
      expect(helper.weather_pic(curr)).to have_text('01d.png')
    end
  end

  describe '#time' do
    it 'returns current time' do

      expect(helper.time).to match(/get at /)
    end
  end
end
