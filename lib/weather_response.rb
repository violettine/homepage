class WeatherResponse

  # need 'self.' here, so that i can use the method everywhere; class method
  def self.get_weather
    @curr_city = params[:curr][:city]
    @forecast_city = params[:forecast][:city]
    exists_weather?
    get_curr_weather_data(Rails.cache.fetch('curr_weather'))
    get_forecast_weather_data(Rails.cache.fetch('forecast_weather'))
  end

  def exists_weather?
    if Rails.cache.fetch('curr_weather') && Rails.cache.fetch('forecast_weather')
      #test = Rails.cache.fetch(cache_name)
     # if test['name'] == city.capitalize
    #   else
    #     # get_curr_or_forecast_weather(city, api_id)
    #     WeatherResponse.get_weather_data(city)
    #   end
    else
    #   # get_curr_or_forecast_weather(city, api_id)
      WeatherResponse.get_weather_data
    end
  end

  def get_weather_data
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
      Rails.cache.write('curr_weather', curr_data, expires_in: 10.minute)
      Rails.cache.write('forecast_weather', forecast_data, expires_in: 10.minute)
    end
  end
end
