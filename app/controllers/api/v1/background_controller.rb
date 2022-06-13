class Api::V1::BackgroundController < ApplicationController 
    def location 
        render json: ImageSerializer.new(BackgroundFacade.get_photo(params[:location]))
    end
end