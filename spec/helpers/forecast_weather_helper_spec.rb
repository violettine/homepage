require 'rails_helper'

RSpec.describe(ForecastWeatherHelper, type: :helper) do
  describe '#forecast_city' do
    it 'returns the city name' do
      fore = {}
      fore['city'] ={ 'name'=> 'Kiel' }

      expect(helper.forecast_city(fore)).to eql('Kiel')
    end
  end
end
