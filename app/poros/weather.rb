class Weather
    attr_reader :id, :hourly, :current, :daily
    def initialize(data)
      @hourly = get_hourly(data[:hourly][0..7])
      @current = get_current(data[:current])
      @daily = get_daily(data[:daily][0..4])
    end


    def get_hourly(hours) 
       hash = hours.map do |hour|
            {
                :time => Time.at(hour[:dt]),
                :temperature => hour[:temp],
                :conditions => hour[:weather][0][:description],
                :icon => hour[:weather][0][:icon]
            }
        end 
        hash
    end

    def get_current(current)
        {
        :datetime => Time.at(current[:dt]),
        :sunrise => current[:sunrise],
        :sunset => current[:sunset],
        :temperature => current[:temp],
        :feels_like => current[:feels_like],
        :humidity => current[:humidity],
        :uvi => current[:uvi],
        :visibility => current[:visisbility],
        :conditions => current[:weather][0][:description],
        :icon => current[:weather][0][:icon]
        }
    end

    def get_daily(days)
        hash = days.map do |day|
        {
        :date => Time.at(day[:dt]),
        :sunrise => day[:sunrise],
        :sunset => day[:sunset],
        :max_temp => day[:temp][:max],
        :min_temp => day[:temp][:min],
        :conditions => day[:weather][0][:description],
        :icon => day[:weather][0][:icon]
        }
        end 
       hash     
    end

end