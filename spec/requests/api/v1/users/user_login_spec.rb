require 'rails_helper' 

describe 'User login' do 
    it 'will allow a user to login if correct credintials are used' do 
        create_list(:user, 5)
        create(:user, email: "test@test.com", password: "password" )
        headers =['Content-Type': 'application/json',
                'Accept': 'application/json']
        body = {'email': 'test@test.com',
                'password': 'password'}
        post '/api/v1/sessions', headers: headers, params: body, as: :json
        expect(response).to be_successful
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:id)
        expect(parsed).to have_key(:type)
        expect(parsed).to have_key(:attributes)
        expect(parsed[:attributes]).to have_key(:email)
        expect(parsed[:attributes]).to have_key(:api_key)
        expect(parsed[:attributes][:email]).to be_a(String)
        expect(parsed[:attributes][:api_key]).to be_a(String)
    end

    it 'will reject a user with bad credentials' do 
        create_list(:user, 5)
        create(:user, email: "test@test.com", password: "password" )
        headers =['Content-Type': 'application/json',
                'Accept': 'application/json']
        body = {'email': 'test@test.com',
                'password': 'passw'}
        post '/api/v1/sessions', headers: headers, params: body, as: :json
        expect(response).to_not be_successful
        expect(response.status).to eq(418)
    end
end 