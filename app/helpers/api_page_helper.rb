module ApiPageHelper
  def getJson(city='berlin')
    data = open('http://api.openweathermap.org/data/2.5/weather?q='+city)
    json_data=JSON.parse(data.read)
    if json_data['message']
      puts 'time for a problem!'
      puts''
      puts''
      puts''
      puts''
    else
      @weather = json_data
    end
  end
end
