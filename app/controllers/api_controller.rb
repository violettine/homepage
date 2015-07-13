require 'weather_response'
require 'yt_api_request'

class ApiController < ApplicationController
  def index
    weather_request
  end

  def youtube_request
    yt_req = YtApiRequest.new
    @resulting_videos = yt_req.youtube_request(params[:search][:term])
  end

  private

  def weather_request
    weather_res = WeatherResponse.new(params)
    @curr_data, @forecast_data, city_exists = weather_res.get_weather

    (flash.now[:alert] = 'Could not find your city! Please check the spelling.') unless city_exists
  end
end
