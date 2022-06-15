class Roadtrip 
    attr_reader :start_city, :end_city, :travel_time, :weather_at_eta

    def initialize(origin, destination, trip_details, weather)
        @start_city = origin
        @end_city = destination
        @travel_time = find_travel_time(trip_details)
        @weather_at_eta = eta_weather(weather)
        binding.pry
    end

    def find_travel_time(data)
        @time = data[:route][:legs][0][:time]
        secs = @time.divmod(60)[1]
        min = @time.divmod(60)[0].divmod(60)[1]
        hours = @time.divmod(60)[0].divmod(60)[0]
        return "#{hours} hours, #{min} minutes, #{secs} seconds"
    end

    def eta_weather(data)
        target_time = Time.now.to_i + @time
        hour = data[:hourly].find{|hour| hour[:dt] >= target_time}
        {
           :temperature => hour[:temp],
           :conditions => hour[:weather][0][:description]
        }
    end
end