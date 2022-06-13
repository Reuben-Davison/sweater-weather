require 'rails_helper' 

describe 'Weather facade' do 
    it "will return a poro of a weather object", :vcr do 
        lat = 39.738453
        lng = -104.984853
        weather = WeatherFacade.get_weather(lat, lng)
        expect(weather).to be_a(Weather) 
        expect(weather.daily).to be_a(Hash)
        expect(weather.current).to be_a(Hash)
        expect(weather.hourly).to be_a(Hash)
    end
end