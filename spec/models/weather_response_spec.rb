require 'rails_helper'

RSpec.describe(WeatherResponse, type: :model) do 
  context 'initialize works fine' do
    it 'knows its curr_city params' do
      resp = WeatherResponse.new
      expect(resp.curr_city).to eql('Berlin')
    end

    it 'changes its curr_city params' do
      par = {}
      par[:curr] = { city: 'Kiel' }
      resp = WeatherResponse.new(par)
      expect(resp.curr_city).to match('Kiel')
    end

    it 'knows its forecast_city params' do
      resp = WeatherResponse.new
      expect(resp.forecast_city).to eql('Berlin')
    end

    it 'changes its forecast_city params' do
      par = {}
      par[:forecast] = { city: 'Kiel' }
      resp = WeatherResponse.new(par)
      expect(resp.forecast_city).to match('Kiel')
    end
  end
end
