require 'rails_helper' 

describe 'Road Trip Facade' do 
    it 'will return a roadtrip object', :vcr do 
        origin = "denver,co"
        destination = 'evergreen,co'
        trip = RoadtripFacade.get_trip(origin, destination)
        expect(trip).to be_a(Roadtrip)
        expect(trip.start_city).to be_a(String)
        expect(trip.end_city).to be_a(String)
        expect(trip.travel_time).to be_a(String)
        expect(trip.start_city).to eq("denver,co")
        expect(trip.end_city).to eq('evergreen,co')
        expect(trip.weather_at_eta).to be_a(Hash)
        expect(trip.weather_at_eta).to have_key(:temperature)
        expect(trip.weather_at_eta).to have_key(:conditions)
        expect(trip.weather_at_eta[:temperature]).to be_a(Float)
        expect(trip.weather_at_eta[:conditions]).to be_a(String)
    end

    it 'trip details will return origin, destination, and travel time', :vcr do
         #unsure of what is happening, trip in pry provides what is expected, yet in the 
         #test is is fshowing a 400 error
        origin = "denver,co"
        destination = 'evergreen,co'
        trip = RoadtripFacade.get_trip_details(origin, destination)
        expect(trip).to have_key(:routes)
        expect(trip[:routes]).to have_key(:legs)
        expect(trip[:routes][:legs][0]).to have_key(:time)
    end 

    
end