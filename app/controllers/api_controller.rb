require 'weather_response'

class ApiController < ApplicationController
  def index
    params[:curr_city] = 'London'
    params[:forecast_city] = 'London'
    if params[:curr]
      params[:curr_city] = params[:curr][:city]
      params[:forecast_city] = 'London'
    elsif params[:forecast]
      params[:forecast_city] = params[:forecast][:city]
      params[:curr_city] = 'London'
    else
      flash.now[:alert] = 'Please try again, I didn\'t get what you want..'
    end

    @curr_data, @forecast_data = WeatherResponse.get_weather(params)
#   flash.now[:alert] = "Could not find your city! Please check the spelling."
  end
end
