class Api::V1::TripsController < ApplicationController 
    def create 
        if User.find_by(api_key: trip_params[:api_key])
            render json: RoadtripSerializer.new(
                RoadtripFacade.get_trip(trip_params[:origin], trip_params[:destination])
            )
        else 
            render json: {text: "no trip for you"}
        end 
    end

    private 

    def trip_params 
        params.require(:trip).permit(:origin, :destination, :api_key)
    end
end
