class BackgroundFacade 
    def self.get_photo(location) 
        Background.new(BackgroundService.photo_by_location(location))
    end
end