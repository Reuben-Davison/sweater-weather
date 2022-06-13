class Api::V1::BooksController < ApplicationController 
    def index
        weather = Api::V1::BooksController.get_weather(params[:location])
        render json: BooksSerializer.new(BooksFacade.make_books_data(params[:location], params[:quantity], weather))
    end

#this method is in the controller so that way books facade didnt have to call on a weather facade
#weather is limited to current before it is passed to the books facade
    def self.get_weather(location)
        coords = MapquestFacade.return_only_lat_and_long(location)
        WeatherFacade.get_weather(coords[:lat], coords[:lng]).current
    end
end