require 'rails_helper' 

describe 'book request' do 
    it 'will return all the given books for a location', :vcr do 
        get '/api/v1/book-search?location=denver,co&quantity=5'
        expect(response).to be_successful 
    end
end