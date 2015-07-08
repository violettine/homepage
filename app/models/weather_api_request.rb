class WeatherApiRequest
  include HTTParty
  base_uri 'http://api.openweathermap.org/data/2.5'

  def initialize(curr_city, forecast_city, period)
    @curr_options = { query: { q: curr_city } }
    @fore_options = { query: { cnt: period, q: forecast_city } }
  end

  def current
    self.class.get('/weather', @curr_options)
  end

  def forecast
    self.class.get('/forecast/daily', @fore_options)
  end
end
