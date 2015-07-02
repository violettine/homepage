module CurrWeatherHelper
  # from here on get all data out of json(curr_weather_data)
  def self.get_curr_weather_data(curr_weather_data)
    self.weather_pic(curr_weather_data)
    @temp = ((curr_weather_data['main']['temp']).to_f - 273.15).round(1)
    @curr_city = curr_weather_data['name']
    self.cloud_view(curr_weather_data)
    @time = Time.now # change this part!!
  end

  def self.cloud_view(curr_weather_data)
    all_clouds_number = curr_weather_data['clouds']['all']
    if all_clouds_number.zero?
      @sky_view = 'sky is clear'
    else
      @sky_view = 'sky is not clear'
    end
  end

  def self.weather_pic(curr_weather_data)
    # add diff weather cases to the pisc from openweathermap.org
    @weather_pic = 'http://openweathermap.org/img/w/01d.png'
  end
end
