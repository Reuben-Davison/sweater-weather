class BooksFacade 
    def self.get_books(location, quantity, weather)
        Books.new(location, LibraryService.get_books_details[0..(quantity - 1)], weather)
    end
end