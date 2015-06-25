module ApiPageHelper
  # ask for current_weather
  def get_weather(city='berlin')
    # Rails.cache.clear
    exists_weather_of(city)
    get_weather_data(Rails.cache.fetch('curr_weather'))
  end

  def exists_weather_of(city)
    if Rails.cache.fetch('curr_weather')
      test = Rails.cache.fetch('curr_weather')
      if test['name'] == city.capitalize
      else
        get_current_weather(city,1)
      end
    else
      get_current_weather(city,1)
    end
  end

  def get_current_weather(city, api_id)
    data = if api_id == 1
        open('http://api.openweathermap.org/data/2.5/weather?q='+city)
      elsif api_id == 2
        open('htp://api.openweathermap.org/data/2.5/forecast?q='+city)
      end

    weather_data = JSON.parse(data.read)
    if weather_data['message']
      puts 'time for a problem!'
      puts''
      puts''
      puts''
      puts''
      # need flash_message afterwards delete puts!
    else
      if api_id == 1
        Rails.cache.write('curr_weather', weather_data, expires_in: 10.minute)
      elsif api_id == 2
        Rails.cache.write('forecast_weather', weather_data, expires_in: 10.minute)
      end
    end
  end
end
