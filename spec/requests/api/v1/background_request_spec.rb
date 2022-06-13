require 'rails_helper' 

describe 'background request' do 
    it 'will return the forcast for a location', :vcr do 
        get '/api/v1/backgrounds?location=denver,co'
        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:attributes)
        expect(parsed[:attributes]).to have_key(:image)
        expect(parsed[:attributes][:image]).to have_key(:location)
        expect(parsed[:attributes][:image]).to have_key(:image_url)
        expect(parsed[:attributes][:image]).to have_key(:credit)
    end
end