class MapquestFacade 
    def self.return_only_lat_and_long(location)
        MapquestService.find_by_location(location)[:results][0][:locations][0][:displayLatLng]
    end
end