class WeatherDetails
  attr_reader :summary,
              :feels_like,
              :humidity,
              :uv_index

  def initialize(forecast)
    @summary = forecast[:currently][:summary]
    @feels_like = forecast[:currently][:apparentTemperature]
    @humidity = forecast[:currently][:humidity]
    @uv_index = forecast[:currently][:uvIndex]
  end
end