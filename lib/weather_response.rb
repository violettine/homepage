class WeatherResponse
  # need 'self.' here, so that i can use the method everywhere; class method
  def self.get_weather_data(city)
    forecast_period = '12'
    curr_response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?q=' + city)
    forecast_response = 
      HTTParty.get('http://api.openweathermap.org/data/2.5/forecast/daily?cnt=' + 
        forecast_period + '&q=' + city)

    curr_data = JSON.parse(curr_response.body)
    forecast_data = JSON.parse(forecast_response.body)

    if curr_response.message == '' || forecast_response.message == "Error: Not found city"
      flash[:alert] = "Could not find the city! Please check the spelling."
    else
      # if api_id == 1
      Rails.cache.write('curr_weather', curr_data, expires_in: 10.minute)
     # elsif api_id == 2
      Rails.cache.write('forecast_weather', forecast_data, expires_in: 10.minute)
     # end
    end
  end
end
