module ApiPageHelper
  # ask for current_weather
  def get_current_weather(city='berlin')
    # Rails.cache.clear
    exists_weather_of(city)
    get_weather_data(Rails.cache.fetch('curr_weather'))
  end

  def exists_weather_of(city)
    if Rails.cache.fetch('curr_weather')
      test = Rails.cache.fetch('curr_weather')
      if test['name'] == city.capitalize
      else
        get_weather(city)
      end
    else
      get_weather(city)
    end
  end

  def get_weather(city)
    data = open('http://api.openweathermap.org/data/2.5/weather?q='+city)
    curr_weather_data = JSON.parse(data.read)
    if curr_weather_data['message']
      puts 'time for a problem!'
      puts''
      puts''
      puts''
      puts''
      # need flash_message
    else
      Rails.cache.write('curr_weather', curr_weather_data, expires_in: 10.minute)
    end
  end

  # from here on get all data out of json(curr_weather_data)
  def get_weather_data(curr_weather_data)
    weather_pic(curr_weather_data)
    @temp = ((curr_weather_data['main']['temp']).to_f - 273.15).round(1)
    @city = curr_weather_data['name']
    sky_view(curr_weather_data)
    @time = Time.now # change this part!!
  end

  def sky_view(curr_weather_data)
    all_clouds_number = curr_weather_data['clouds']['all']
    if all_clouds_number == 0
      @sky_view = 'sky is clear'
    else
      @sky_view = 'sky is not clear'
    end
  end

  def weather_pic(curr_weather_data)
    # add diff weather cases to the pisc from openweathermap.org
    @weather_pic = 'http://openweathermap.org/img/w/01d.png'
  end
end
