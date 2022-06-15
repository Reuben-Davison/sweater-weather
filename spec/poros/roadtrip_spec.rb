require 'rails_helper'

describe 'Roadtrip poro' do 
    it 'can make an instance' do
        origin = "denver,co"
        destination = 'evergreen,co'  
        trip = {:route=>
                    {:hasTollRoad=>false,
                     :legs=>
                         [{:hasTollRoad=>false, :time=>2037}]
                    }
                }
        weather = {
                    :lat=>39.6335,
                    :lon=>-105.3289,
                    :hourly=>[
                        {:dt=>1665268400,
                            :temp=>69.24,
                            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]},
                        {:dt=>1665272000,
                            :temp=>67.3,
                            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
                        {:dt=>1665275600,
                            :temp=>64.45,
                            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]},
                        {:dt=>1665279200,
                            :temp=>60.4,
                            :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01n"}]}
                    ]
                }
        roadtrip = Roadtrip.new(origin, destination, trip, weather)
        expect(roadtrip.start_city).to eq("denver,co")
        expect(roadtrip.end_city).to eq('evergreen,co')
        expect(roadtrip.travel_time).to eq("0 hours, 33 minutes, 57 seconds")
        expect(roadtrip.weather_at_eta).to eq({:temperature=>69.24, :conditions=>"clear sky"})
    end
end