class Api::V1::ForecastController < ApplicationController 
    def location 
        cord = MapquestFacade.return_only_lat_and_long(params[:location])
        
        binding.pry
    end
end