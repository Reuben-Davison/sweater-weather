class WeatherService 
    def self.find_hourly_weather(lat, lng)
        get_url("exclude=minutely,alerts,current,daily&units=imperial&lat=#{lat}&lon=#{lng}")
    end

    def self.find_weather(lat, lng) 
        get_url("exclude=minutely,alerts&units=imperial&lat=#{lat}&lon=#{lng}")
    end

    def self.get_url(uri)
        response = Faraday.get("https://api.openweathermap.org/data/2.5/onecall?#{uri}") do |f|
            f.params[:appid] = ENV['open_weather_api']
            end
        JSON.parse(response.body, symbolize_names: true)
    end
end