class LibraryService 
    def self.get_books_details(location)
        get_url("q=place:#{location}")
    end

    def self.get_url(uri)
        response = Faraday.get("http://openlibrary.org/search.json?#{uri}")
        JSON.parse(response.body, symbolize_names: true)
    end
end