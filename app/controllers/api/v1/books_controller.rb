class Api::V1::BooksController < ApplicationController 
    def index
        render json: BooksSerializer.new(BooksFacade.get_books(params[:location], params[:quantity]), get_weather(params[:location]))
    end

#i put this method in the controller so that way books facade didnt have to call on a weather facade
    def self.get_weather(location)
        coords = MapquestFacade.return_only_lat_and_long(location)
        WeatherFacade.get_weather(coords[:lat], coords[:lng]).current
    end
end