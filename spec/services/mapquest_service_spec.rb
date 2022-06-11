require 'rails_helper'
# RSpec.describe 'Mapquest Service' do 
    describe 'Mapquest geocoding service' do 
        it 'will return longitude and latitude based on location params', :vcr do 
            response = MapquestService.find_by_location('denver, co')
            # binding.pry
            expect(response).to have_key(:results)
            expect(response[:results][0]).to have_key(:locations)
            expect(response[:results][0][:locations][0]).to have_key(:displayLatLng)
            expect(response[:results][0][:locations][0][:displayLatLng]).to have_key(:lat)
            expect(response[:results][0][:locations][0][:displayLatLng]).to have_key(:lng)
        end 
    end
# end