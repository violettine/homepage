class WeatherResponse
  def initialize(params = {})
    @curr_city = 'Berlin'
    @forecast_city = 'Berlin'
    if params[:curr]
      @curr_city = params[:curr][:city]
    elsif params[:forecast]
      @forecast_city = params[:forecast][:city]
    end
    @existent_city = true
  end

  def get_weather
    exists_weather?
    return Rails.cache.fetch('curr_weather'), Rails.cache.fetch('forecast_weather'), @existent_city
  end

  def exists_weather?
    # Rails.cache.clear
    unless Rails.cache.fetch('curr_weather') && Rails.cache.fetch('forecast_weather')
      get_weather_api_data
    else self.same_curr_city?('curr_weather') && self.same_forecast_city?('forecast_weather')
      get_weather_api_data
    end
  end

  def same_curr_city?(cache_name)
    curr = Rails.cache.fetch(cache_name)
    ((curr['name']).eql?(@curr_city.capitalize))
  end

  def same_forecast_city?(cache_name)
    forecast = Rails.cache.fetch(cache_name)
    (forecast['city']['name'].eql?(@forecast_city.capitalize))
  end

  def get_weather_api_data
    forecast_period = '12'
    data = GetDataFromWeatherApi.new(@curr_city, @forecast_city, forecast_period)

    if (data.current['cod'] == '404' || data.forecast['cod'] == '404')
      @existent_city = false
      @curr_city = 'berlin'
      @forecast_city = 'berlin'
      get_weather_api_data
    else
      curr_data = JSON.parse((data.current).body)
      forecast_data = JSON.parse(data.forecast.body)
      Rails.cache.write('curr_weather', curr_data, expires_in: 10.minute)
      Rails.cache.write('forecast_weather', forecast_data, expires_in: 10.minute)
    end
  end
end
