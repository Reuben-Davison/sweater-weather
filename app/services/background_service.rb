class BackgroundService

    def self.photo_by_location(name)
        get_url("query=#{name}cityscape")
    end

    def self.get_url(uri)
        response = Faraday.get("https://api.unsplash.com/search/photos?#{uri}") do |f|
            f.params[:client_id] = ENV['unsplash_api']
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end