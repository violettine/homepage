require 'weather_response'

class ApiController < ApplicationController
  def index
    if params[:curr]
      params[:curr_city] = params[:curr][:city]
      params[:forecast_city] = 'London'
      puts params[:curr_city]
      puts '/////////////////////////'
    elsif params[:forecast]
      params[:forecast_city] = params[:forecast][:city]
      params[:curr_city] = 'London'
      puts params[:forecast_city]
      puts '/////////////////////////'
    else
      params[:curr_city] = 'London'
      params[:forecast_city] = 'London'

      puts 'nothing..'
      puts '/////////////////////////'
      flash[:alert] = 'Please try again, I didn\'t get what you want..'
    end

    @curr_data, @forecast_data = WeatherResponse.get_weather(params)
  end
end
