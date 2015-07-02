require 'open-uri'
require 'json'
require 'weather_response'

class WeatherController < ApplicationController
  # first load: default city and load both apis
  # needs at request: which city?, which method curr or forecast?
  def index
    if params[:curr]
      params[:forecast] = 'London'
      puts params[:curr]
      puts '/////////////////////////'
    elsif params[:forecast]
      params[:curr] = 'London'
      puts params[:forecast]
      puts '/////////////////////////'
    else
      puts 'nothing..'
      puts '/////////////////////////'
      flash[:alert] = 'Please try again, I didn\'t get what you want..'
    end

    WeatherResponse.get_weather
  end
end
