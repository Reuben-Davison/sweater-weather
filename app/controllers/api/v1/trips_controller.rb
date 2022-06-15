class Api::V1::TripsController < ApplicationController 
    def create 
        if User.find_by(api_key: trip_params[:api_key])
            begin 
            render json: RoadtripSerializer.new(
                RoadtripFacade.get_trip(
                    trip_params[:origin], 
                    trip_params[:destination])
            )
            rescue NoMethodError 
                render json: { 
                    "data": {
                        "id": nil,
                        "type": "roadtrip",
                        "attributes": { 
                            "start_city": trip_params[:origin],
                            "end_city": trip_params[:destination],
                            "travel_time": "impossible route",
                            "weather_at_eta": ""
                        }
                    }
                }
            end 
        else 
            render json: {text: "Invalid API key"}
        end 
    end

    private 

    def trip_params 
        params.require(:trip).permit(:origin, :destination, :api_key)
    end
end
