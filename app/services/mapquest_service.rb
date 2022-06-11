class MapquestService

    def self.find_by_location(name)
        get_url("address?location=#{name}")
    end

    def self.get_url(uri)
        response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/#{uri}") do |f|
            f.params[:key] = ENV['map_quest_api']
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end