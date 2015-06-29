module ForecastWeatherHelper
  def get_forecast_weather_data(forecast_weather_data)
    @all_data = forecast_weather_data
    @date = forecast_weather_data['list'][1]['dt']
    @forecast_city = forecast_weather_data['city']['name']
  end
end
