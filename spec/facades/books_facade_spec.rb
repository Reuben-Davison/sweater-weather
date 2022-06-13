require 'rails_helper' 

describe 'Books Facade' do 
    it 'can create a poro', :vcr do
        location = "boston,ma"
        quantity = 5
        weather = Api::V1::BooksController.get_weather(location)
        books = BooksFacade.get_books(location, quantity, weather)
        expect(books).to be_a(Books)
    end
end