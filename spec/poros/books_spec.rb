require 'rails_helper' 

describe 'books poro' do 
    it 'can create a poro for a books object', :vcr do 
        location = "boston,ma"
        books = BooksFacade.get_books(location)
        weather = Api::V1::BooksController.get_weather(location)
        books = Books.new("boston.ma", books, weather, 3)
        binding.pry
        expect(books.books).to have_key(:isbn)
        expect(books.books).to have_key(:title)
        expect(books.books).to have_key(:publisher)
        expect(books.destination).to eq(location)
        expect(books.forecast).to have_key(:summary)
        expect(books.forecast).to have_key(:temperature)
        expect(books.forecast).to_not have_key(:uvi)

    end

    it 'can return limited info for books', :vcr do 
    end
end