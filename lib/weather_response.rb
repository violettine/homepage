class WeatherResponse
  # need 'self.' here, so that i can use the method everywhere; class method
  def self.get_weather(params = {})
    puts '...............................response....'

    @curr_city = params[:curr_city]
    @forecast_city = params[:forecast_city]
    self.exists_weather?
  end

  def self.exists_weather?
    puts '...............................exists?'
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
    puts '...............................data!'
    forecast_period = '12'
    curr_response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=' + @curr_city)
    forecast_response = 
      HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?cnt=' + 
        forecast_period + '&q=' + @forecast_city)

    curr_data = JSON.parse(curr_response.body)
    forecast_data = JSON.parse(forecast_response.body)
    if curr_response.message == '' || forecast_response.message == "Error: Not found city"
      flash[:alert] = "Could not find the city! Please check the spelling."
    else
      puts '...............................caching...'
      Rails.cache.write('curr_weather', curr_data, expires_in: 10.minute)
      Rails.cache.write('forecast_weather', forecast_data, expires_in: 10.minute)
    end
  end
end
