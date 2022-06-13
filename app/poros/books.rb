class Books 
    attr_reader :id, :destination, :forecast, :total_books_found, :books

    def initialize(location, books, weather, quantity)
        @destination = location 
        @forecast = {summary: weather[:conditions], temperature: (weather[:temperature].to_s + " F")}
        @total_books_found = books[:numFound]
        @books = book_info(books)[0..(quantity - 1)]
    end

    def book_info(books)
        hash = books[:docs].map do |book|
            {
                :isbn => book[:isbn],
                :title => book[:title],
                :publisher => book[:publisher]
            }
        end 
        hash
    end

end