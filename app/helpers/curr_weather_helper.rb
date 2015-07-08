module CurrWeatherHelper
  def curr_city(curr_data)
    curr_data['name']
  end

  def kelvin_to_celsius(curr_data)
    # converting kelv temp into celc
    ((curr_data['main']['temp']).to_f - 273.15).round(1)
  end

  def cloud_view(curr_data)
    all_clouds_number = curr_data['clouds']['all']
    @sky_view = all_clouds_number.zero? ? 'sky is clear' : 'sky is not clear'
  end

  def weather_pic
    # ToDo: add some weather cases to use diff pics from openweathermap.org
    @weather_pic = 'http://openweathermap.org/img/w/01d.png'
  end

  def time
    Time.new.strftime('get at %H:%M on %D')
  end
end
