class RoadtripFacade 
    def self.get_trip(origin, destination)
        trip_details = get_trip_details(origin, destination)
        weather = destination_weather(destination, trip_details[:time])
        Roadtrip.new(trip_details, weather)
    end

    def self.get_trip_details(origin, destination)
        MapquestService.get_route(origin, destination)
        binding.pry
    end

    def destination_weather(destination, time) 

    end

end