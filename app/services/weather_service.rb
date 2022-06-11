class WeatherService 
    def self.find_weather(lat, lng) 
        get_url("lat=#{lat}&lon=#{lng}")
    end

    def self.get_url(uri)
        response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?exclude=minutely,alerts&#{uri}") do |f|
            f.params[:appid] = ENV['open_weather_api']
            end
        JSON.parse(response.body, symbolize_names: true)
    end
end