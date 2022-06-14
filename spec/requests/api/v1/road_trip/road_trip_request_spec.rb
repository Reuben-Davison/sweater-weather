require 'rails_helper' 

describe 'road trip request' do 
    it ' will return json with start city, end city, travel time and weather at destination' do 
        user = create(:user)
        body = {
            origin: 'Denver,CO',
            desination: 'Pueblo,CO',
            api_key: user.api_key
        }
        headers ={'Content-Type': 'application/json',
                  'Accept': 'application/json'}
        post '/api/v1/road_trip', headers: headers, params: body, as: :json
        expect(response).to be_succesful

    end
end