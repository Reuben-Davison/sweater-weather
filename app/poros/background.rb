class Background 
    attr_reader :id, :image 

    def initialize(data) 
        @image = getimage(data[:results][0])
    end

    def getimage(info)
        {
        location: info[:tags][0][:title],
        image_url: info[:urls][:full],
        credit: {source: info[:links][:self], author: info[:user][:name], author_link: info[:user][:links][:self]}
        }
    end
end