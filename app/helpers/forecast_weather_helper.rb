module ForecastWeatherHelper
  def forecast_city(forecast_data)
    forecast_data['city']['name']
  end
end
