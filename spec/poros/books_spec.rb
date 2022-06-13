require 'rails_helper' 

describe 'books poro' do 
    it 'can create a poro for a books object', :vcr do 
        location = "boston,ma"
        books_data = BooksFacade.get_books(location)
        weather = Api::V1::BooksController.get_weather(location)
        books = Books.new(location, books_data, weather, 3)
        expect(books.books[0]).to have_key(:isbn)
        expect(books.books[0]).to have_key(:title)
        expect(books.books[0]).to have_key(:publisher)
        expect(books.destination).to eq(location)
        expect(books.forecast).to have_key(:summary)
        expect(books.forecast).to have_key(:temperature)
        expect(books.forecast).to_not have_key(:uvi)

    end

    it 'can return limited info for books', :vcr do 
        location = "boston,ma"
        books_data = BooksFacade.get_books(location)
        weather = Api::V1::BooksController.get_weather(location)
        books = Books.new(location, books_data, weather, 3)
        expect(books.books[0]).to_not have_key(:key)
        expect(books.books[0]).to_not have_key(:seed)
    end
end