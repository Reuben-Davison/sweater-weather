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
        parsed = JSON.parse(response.body, symbolize_names: true)
        expect(parsed).to have_key(:text) 
        expect(parsed[:text]).to eq("New User test@test.com has been created")
    end
end