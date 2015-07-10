require 'weather_response'
require 'yt_api_request'

class ApiController < ApplicationController
  def index
    weather_res = WeatherResponse.new(params)
    @curr_data, @forecast_data, city_exists = weather_res.get_weather

    (flash.now[:alert] = 'Could not find your city! Please check the spelling.') unless city_exists
  end

  def youtube_request
    YtApiRequest.youtube_request('for the birds')
  end
end
