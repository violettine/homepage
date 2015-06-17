module ApiPageHelper
  def getJson(city='berlin')
    data = open('http://api.openweathermap.org/data/2.5/weather?q=berlin')
    json_data=JSON.parse(data.read)
    if json_data['message']
      puts 'time for a problem!'
    else
      @weather = json_data['main']['temp']
    end
  end
end
