module ApiPageHelper
  def get_weather(city)
    data = open('http://api.openweathermap.org/data/2.5/weather?q='+city)
    @curr_weather_data=JSON.parse(data.read)
    if @curr_weather_data['message']
      puts 'time for a problem!'
      puts''
      puts''
      puts''
      puts''
      # need flash_message
    else
      # curr_weather_data.save
    end
  end

  def data_fresh
    if(weather_data.updated_at < 10.minutes)
      true
    else
      false
    end
  end

  def have_weather_of(city)
    if have_no_weather_in_db
      get_weather(city)
    else
      if(city==old_city) && data_fresh?
        use_db
      else
        get_weather(city)
      end
    end
  end

  def sky_view(curr_weather_data)
    all_clouds_number = curr_weather_data['clouds']['all']
    if all_clouds_number ==0
      @sky_view= 'sky is clear'
    else
      @sky_view = 'sky is not clear'
    end
  end

  def get_weather_data(curr_weather_data)
    # @tempCelsius = (curr_weather_data    .to_f - 273.15).round(1)
    # @clouds =
    @temp = ((curr_weather_data['main']['temp']).to_f - 273.15).round(1)
    @all_data = curr_weather_data
    @city = curr_weather_data['name']
    sky_view(curr_weather_data)
    @time = Time.now # change this part!!
  end

  def get_current_weather(city='berlin')
    # have_weather_of(city)
    get_weather(city)
    get_weather_data(@curr_weather_data)
  end
end


