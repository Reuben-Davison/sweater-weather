class ForecastSerializer
  include JSONAPI::Serializer
  attributes :hourly, :current, :daily
end
