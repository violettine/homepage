require 'weather_response'

class ApiController < ApplicationController
  def index
    params[:curr_city] = 'berlin'
    params[:forecast_city] = 'berlin'
    if params[:curr]
      params[:curr_city] = params[:curr][:city]
    elsif params[:forecast]
      params[:forecast_city] = params[:forecast][:city]
    end

    @curr_data, @forecast_data, city_exists = WeatherResponse.get_weather(params)

    (flash.now[:alert] = "Could not find your city! Please check the spelling.") unless city_exists
  end
end
