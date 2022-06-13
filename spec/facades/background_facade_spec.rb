require 'rails_helper' 

describe 'background facade' do 
    it 'will return a pictures info', :vcr do 
        location = "boston, ma"
        response = BackgroundFacade.get_photo(location)
        expect(response).to be_a(Background)
        expect(response.image).to have_key(:location)
        expect(response.image).to have_key(:image_url)
        expect(response.image).to have_key(:credit)
    end
end