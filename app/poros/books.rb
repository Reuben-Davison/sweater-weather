class Books 
    attr_reader :id, :destination, :forecast, :total_books_found, :books

    def initialize(location, books, weather)
        binding.pry
      @location = location 
    end
end