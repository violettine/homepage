module ApiPageHelper
  # ask for current_weather
  # def get_weather(city = 'berlin', api_id)
  #   # Rails.cache.clear
  #   if api_id == 1
  #     cache_name = 'curr_weather'
  #   elsif api_id == 2
  #     cache_name = 'forecast_weather'
  #   end

  #   exists_weather_of(city, api_id, cache_name)
  #   if api_id == 1
  #     get_curr_weather_data(Rails.cache.fetch('curr_weather'))
  #   elsif api_id == 2
  #     get_forecast_weather_data(Rails.cache.fetch('forecast_weather'))
  #   end
  # end

  # def exists_weather_of(city, api_id, cache_name)
  #   if Rails.cache.fetch(cache_name)
  #     test = Rails.cache.fetch(cache_name)
  #    # if test['name'] == city.capitalize
  #   #   else
  #   #     # get_curr_or_forecast_weather(city, api_id)
  #   #     WeatherResponse.get_weather_data(city)
  #   #   end
  #   else
  #   #   # get_curr_or_forecast_weather(city, api_id)
  #     WeatherResponse.get_weather_data(city)
  #   end
  # end

  # def get_curr_or_forecast_weather(city, api_id)
  #   forecast_range = '12'
  #   data = if api_id == 1
  #       open('http://api.openweathermap.org/data/2.5/weather?q=' + city)
  #     elsif api_id == 2
  #       open('http://api.openweathermap.org/data/2.5/forecast/daily?cnt=' + forecast_range + '&q=' + city)
  #     end

  #   weather_data = JSON.parse(data.read)
  #   if weather_data['message'] == '' || weather_data['message'] == "Error: Not found city"
  #     # flash[:alert] = "Could not find the city! Please check the spelling."
  #   else
  #     if api_id == 1
  #       Rails.cache.write('curr_weather', weather_data, expires_in: 10.minute)
  #     elsif api_id == 2
  #       Rails.cache.write('forecast_weather', weather_data, expires_in: 10.minute)
  #     end
  #   end
  # end
end
