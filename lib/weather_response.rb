class WeatherResponse
  # need 'self.' here, so that i can use the method everywhere; class method
  def self.get_weather(params = {})
    @existent_city = true
    @curr_city = params[:curr_city]
    @forecast_city = params[:forecast_city]
    self.exists_weather?
    return Rails.cache.fetch('curr_weather'), Rails.cache.fetch('forecast_weather'), @existent_city
  end

  def self.exists_weather?
    Rails.cache.clear
    if Rails.cache.fetch('curr_weather') && Rails.cache.fetch('forecast_weather')

      #test = Rails.cache.fetch(cache_name)
     # if test['name'] == city.capitalize
    #   else
    #     # get_curr_or_forecast_weather(city, api_id)
    #     WeatherResponse.get_weather_data(city)
    #   end
    else
    #   # get_curr_or_forecast_weather(city, api_id)
      self.get_weather_api_data
    end
  end

  def self.get_weather_api_data# params direkt übergeben
    forecast_period = '12'
    curr_response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=' + @curr_city)
    forecast_response = 
      HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?cnt=' + 
        forecast_period + '&q=' + @forecast_city)

    if(curr_response['cod'] == '404' || forecast_response['cod'] == '404')
      @existent_city = false
      @curr_city = 'london'
      @forecast_city = 'london'
      self.get_weather_api_data
    else
      curr_data = JSON.parse(curr_response.body)
      forecast_data = JSON.parse(forecast_response.body)
      Rails.cache.write('curr_weather', curr_data, expires_in: 10.minute)
      Rails.cache.write('forecast_weather', forecast_data, expires_in: 10.minute)
    end
  end
end
