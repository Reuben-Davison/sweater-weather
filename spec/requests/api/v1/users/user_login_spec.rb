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
    end
end 