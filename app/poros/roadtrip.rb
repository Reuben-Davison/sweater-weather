class Roadtrip 
    attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

    def initialize(origin, destination, trip_details, weather)
        @origin = origin
        @destination = destination
        @travel_time = find_travel_time(trip_details)
        @weather_at_eta = eta_weather(weather)
    end

    def find_travel_time(data)

    end

    def eta_weather(data)
        
    end
end