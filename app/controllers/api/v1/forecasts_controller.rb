class Api::V1::ForecastsController < ApplicationController 
    def index 
        cord = MapquestFacade.return_only_lat_and_long(params[:location])
        render json: ForecastSerializer.new(
            WeatherFacade.get_weather(cord[:lat], cord[:lng])
        )
    end
end