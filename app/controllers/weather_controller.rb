require 'open-uri'
require 'json'
require 'weather_response'

class WeatherController < ApplicationController

  def index
    if params[:curr]
      curr_city = params[:curr][:city]
    else
      curr_city = 'London'
    end

    WeatherResponse.get_weather_data(curr_city)

    if params[:forecast]
      forecast_city = params[:forecast][:city]
    else
      forecast_city = 'London'
    end
  end
end
