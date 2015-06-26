module ForecastWeatherHelper
  def get_forecast_weather_data(forecast_weather_data)
    @all_data = forecast_weather_data
    @date = forecast_weather_data['list'][1]['dt_txt']
    @forecast_city = forecast_weather_data['city']['name']
  end
end


# {"cod"=>"200", "message"=>0.0108, #"city"=>

# #  {"id"=>2891122, "name"=>"Kiel", "coord"=> {"lon"=>10.13489, "lat"=>54.321331}, 
# #  "country"=>"DE", "population"=>0, "sys"=>{"population"=>0}}, 

#   "cnt"=>36, "list"=>

#     [
#       {"dt"=>1435233600, "main"=>
#       {"temp"=>291.47, "temp_min"=>288.524, "temp_max"=>291.47, "pressure"=>1032.24, 
#         "sea_level"=>1033.28, "grnd_level"=>1032.24, "humidity"=>93, "temp_kf"=>2.95}, 
#       "weather"=>
#         [{"id"=>500, "main"=>"Rain", "description"=>"light rain", "icon"=>"10d"}], 
#         "clouds"=>{"all"=>80}, "wind"=>{"speed"=>5.81, "deg"=>263.501}, "rain"=>{"3h"=>0.005}, 
#         sys"=>{"pod"=>"d"}, "dt_txt"=>"2015-06-25 12:00:00"}, 

#     {"dt"=>1435244400, "main"=>{"temp"=>291.58, "temp_min"=>289.226, "temp_max"=>291.58, "pressure"=>1032.04, "sea_level"=>1032.9, "grnd_level"=>1032.04, "humidity"=>89, "temp_kf"=>2.36}, "weather"=>[{"id"=>803, "main"=>"Clouds", "description"=>"broken clouds", "icon"=>"04d"}]
