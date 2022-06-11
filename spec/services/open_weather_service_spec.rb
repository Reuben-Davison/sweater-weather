require 'rails_helper'
describe 'Open Weather Service' do 
    it 'will return weather forcast based on lat and lng', :vcr do 
        lat = 39.738453
        lng = -104.984853
        response = WeatherService.find_weather(lat, lng)
        expect(response).to have_key(:current)
        expect(response).to have_key(:hourly)
        expect(response).to have_key(:daily)
    end 
end
