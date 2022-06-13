require 'rails_helper' 

describe 'forecast request' do 
    it 'will return the forcast for a location', :vcr do 
        get '/api/v1/forecast?location=denver,co'
        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:attributes)
        expect(parsed[:attributes]).to have_key(:current)
        expect(parsed[:attributes]).to have_key(:daily)
        expect(parsed[:attributes]).to have_key(:hourly)
    end
end