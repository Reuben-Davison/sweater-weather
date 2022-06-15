class MapquestService
    def self.get_route(origin, destination)
        get_url("directions/v2/route?from=#{origin}&to=#{destination}")
    end

    def self.find_by_location(name)
        get_url("geocoding/v1/address?location=#{name}")
    end

    def self.get_url(uri)
        response = Faraday.get("http://www.mapquestapi.com/#{uri}") do |f|
            f.params[:key] = ENV['map_quest_api']
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end