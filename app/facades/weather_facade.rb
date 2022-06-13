class WeatherFacade 
    def self.get_weather(lat, lng) 
        Weather.new(WeatherService.find_weather(lat, lng))
    end
end