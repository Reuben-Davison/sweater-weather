class BooksFacade 
    def self.make_books_data(location, quantity, weather)
        Books.new(location, get_books(location), weather)
    end
    def get_books(location)
        LibraryService.get_books_details(location)
    end
end