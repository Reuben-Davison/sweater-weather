class RoadtripFacade 
    def self.get_trip(origin, destination)
        trip_details = get_trip_details(origin, destination)
        weather = destination_weather(destination)
        Roadtrip.new(origin, destination, trip_details, weather)
    end

    def self.get_trip_details(origin, destination)
        MapquestService.get_route(origin, destination)
    end

    def self.destination_weather(destination)
        coords = MapquestService.find_by_location(destination)[:results][0][:locations][0][:displayLatLng]
        WeatherService.find_hourly_weather(coords[:lat], coords[:lng])
    end

    def eta_calculation(trip_time_length)
       Time.now.to_i + trip_time_length[:route][:legs][0][:time]
    end

end