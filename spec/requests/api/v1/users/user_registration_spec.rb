require 'rails_helper'

describe 'User Registration' do 
    it 'can create a new user' do 
        headers =['Content-Type': 'application/json',
                'Accept': 'application/json']
        body = {'email': 'test@test.com',
                'password': 'password',
                'password_confirmation': 'password'}
        post '/api/v1/users', headers: headers, params: body, as: :json
        expect(response).to be_successful 
        expect(response.status).to eq(201)
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:attributes) 
        expect(parsed).to have_key(:id) 
        expect(parsed).to have_key(:type) 
        expect(parsed[:attributes]).to have_key(:email)
        expect(parsed[:attributes]).to have_key(:api_key)
        expect(parsed[:attributes][:email]).to be_a(String)
        expect(parsed[:attributes][:api_key]).to be_a(String)
    end
end