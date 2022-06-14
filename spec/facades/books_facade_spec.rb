require 'rails_helper' 

describe 'Books Facade' do 
    it 'can create a poro', :vcr do
        location = "boston,ma"
        quantity = 5
        weather = {
            datetime: "2022-06-13 14:32:32 -0600",
            sunrise: "1655111216", 
            sunset: "1655166109", 
            temperature: "83.23", 
            feels_like: "82.98", 
            humidity: "43", 
            uvi: "2.27", 
            visibility: nil, 
            conditions: "broken clouds", 
            icon: "04d"
        }
        books = BooksFacade.make_books_data(location, quantity, weather)
        expect(books).to be_a(Books)
    end

    it 'will get the books data and limit it to quantity', :vcr do 
        location = "boston,ma"
        books_data = BooksFacade.get_books(location)
        expect(books_data).to be_a(Hash)
        expect(books_data).to have_key(:numFound)
        expect(books_data).to have_key(:docs)
        expect(books_data[:docs]).to be_an(Array)
    end
end