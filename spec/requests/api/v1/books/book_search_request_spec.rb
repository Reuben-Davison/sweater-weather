require 'rails_helper' 

describe 'book request' do 
    it 'will return all the given books for a location', :vcr do 
        get '/api/v1/book-search?location=denver,co&quantity=5'
        expect(response).to be_successful 
        parsed = JSON.parse(response.body, symbolize_names: true)[:data]
        expect(parsed).to have_key(:attributes)
        expect(parsed).to have_key(:id)
        expect(parsed).to have_key(:type)
        expect(parsed[:attributes]).to have_key(:destination)
        expect(parsed[:attributes]).to have_key(:forecast)
        expect(parsed[:attributes]).to have_key(:total_books_found)
        expect(parsed[:attributes]).to have_key(:books)
        expect(parsed[:attributes][:books].count).to be <= 5
        expect(parsed[:attributes][:destination]).to eq("denver,co")
    end

    it '#get_weather', :vcr do 
        location = 'boston,ma'
        weather = Api::V1::BooksController.get_weather(location)
        expect(weather).to be_a(Hash)
        expect(weather).to have_key(:temperature)
        expect(weather).to have_key(:conditions)
    end
end