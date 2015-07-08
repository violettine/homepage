require 'rails_helper'

RSpec.describe(WeatherResponse, type: :model) do 
  context 'initialize works fine' do
    it 'knows its params' do
      resp = WeatherResponse.new
      expect(resp).to match(/Berlin/)
    end

    it 'changes its params' do
      par = {}
      par[:curr] = { city: 'kiel' }
      resp = WeatherResponse.new(par)
      expect(resp).to match(/Kiel/)
    end
  end
end
