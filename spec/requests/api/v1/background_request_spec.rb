require 'rails_helper' 

describe 'background request' do 
    it 'will return the forcast for a location', :vcr do 
        get '/api/v1/backgrounds?location=denver,co'
        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        binding.pry
        expect(parsed).to have_key(:data)
    end
end