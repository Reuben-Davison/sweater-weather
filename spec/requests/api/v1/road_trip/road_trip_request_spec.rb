require 'rails_helper' 

describe 'road trip request' do 
    it ' will return json with start city, end city, travel time and weather at destination', :vcr do 
        user = create(:user)
        body = {
            origin: 'Denver,CO',
            destination: 'Pueblo,CO',
            api_key: user.api_key
        }
        headers ={'Content-Type': 'application/json',
                  'Accept': 'application/json'}
        post '/api/v1/road_trip', headers: headers, params: body, as: :json
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:attributes)
        expect(parsed).to have_key(:id)
        expect(parsed).to have_key(:type)
        expect(parsed[:attributes]).to be_a(Hash)
        expect(parsed[:id]).to eq(nil)
        expect(parsed[:type]).to be_a(String)
        expect(parsed[:attributes]).to have_key(:start_city)
        expect(parsed[:attributes]).to have_key(:end_city)
        expect(parsed[:attributes]).to have_key(:travel_time)
        expect(parsed[:attributes]).to have_key(:weather_at_eta)
        expect(parsed[:attributes][:start_city]).to be_a(String)
        expect(parsed[:attributes][:end_city]).to be_a(String)
        expect(parsed[:attributes][:travel_time]).to be_a(String)
        expect(parsed[:attributes][:weather_at_eta]).to be_a(Hash)
        expect(parsed[:attributes][:weather_at_eta]).to have_key(:temperature)
        expect(parsed[:attributes][:weather_at_eta]).to have_key(:conditions)
        expect(parsed[:attributes][:weather_at_eta][:temperature]).to be_a(Float)
        expect(parsed[:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end

    it "will rescure itself from an invalid route", :vcr do 
        user = create(:user)
        body = {
            origin: 'Denver,CO',
            destination: 'Iceland',
            api_key: user.api_key
        }
        headers ={'Content-Type': 'application/json',
                  'Accept': 'application/json'}
        post '/api/v1/road_trip', headers: headers, params: body, as: :json
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:attributes)
        expect(parsed).to have_key(:id)
        expect(parsed).to have_key(:type)
        expect(parsed[:attributes]).to be_a(Hash)
        expect(parsed[:id]).to eq(nil)
        expect(parsed[:type]).to be_a(String)
        expect(parsed[:attributes]).to have_key(:start_city)
        expect(parsed[:attributes]).to have_key(:end_city)
        expect(parsed[:attributes]).to have_key(:travel_time)
        expect(parsed[:attributes]).to have_key(:weather_at_eta)
        expect(parsed[:attributes][:start_city]).to be_a(String)
        expect(parsed[:attributes][:end_city]).to be_a(String)
        expect(parsed[:attributes][:travel_time]).to be_a(String)
        expect(parsed[:attributes][:travel_time]).to eq("Impossible route")
        expect(parsed[:attributes][:weather_at_eta]).to eq("")
    end

    it 'requires a valid api key' do 
        body = {
            origin: 'Denver,CO',
            destination: 'Iceland',
            api_key: 'madeupapikey'
        }
        headers ={'Content-Type': 'application/json',
                  'Accept': 'application/json'}
        post '/api/v1/road_trip', headers: headers, params: body, as: :json
        expect(response.status).to eq(418)
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to have_key(:text)
        expect(parsed[:text]). to eq("Invalid API key")

    end
end