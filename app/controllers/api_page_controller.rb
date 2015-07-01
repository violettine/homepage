require 'open-uri'
require 'json'
require 'weather_response'

class ApiPageController < ApplicationController

  def index
    WeatherResponse.get_weather_data
  end
end
