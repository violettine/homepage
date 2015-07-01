require 'open-uri'
require 'json'
require 'weather_response'

class ApiPageController < ApplicationController

  def index
    if params[:curr]
      city = params[:curr][:city]
    else
      city = 'London'
    end

    WeatherResponse.get_weather_data(city)
  end
end
