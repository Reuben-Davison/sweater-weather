require 'rails_helper' 

describe 'Books Facade' do 
    it 'can create a poro', :vcr do
        location = "boston,ma"
        quantity = 5
        weather = Api::V1::BooksController.get_weather(location)
        books = BooksFacade.make_books_data(location, quantity, weather)
        expect(books).to be_a(Books)
    end

    it 'will get the books data and limit it to quantity', :vcr do 
        location = "boston,ma"
        books = BooksFacade.new
        books_data = books.get_books(location)
        expect(books).to be_a(BooksFacade)
        expect(books_data).to have_key(:numFound)
        expect(books_data).to have_key(:docs)
        
    end
end