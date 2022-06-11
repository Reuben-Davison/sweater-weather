require 'rails_helper'

describe 'Mapquest facade' do 
    it 'will return only the lat and long for a query', :vcr do 
        location = "boston, ma"
        response = MapquestFacade.return_only_lat_and_long(location)
        binding.pry
        expect(response).to have_key(:lat)
        expect(response).to have_key(:lng)
    end
end