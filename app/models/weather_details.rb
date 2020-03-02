class WeatherDetails

  def initialize(forecast)
    @summary = forecast[:currently][:summary]
    @feels_like = forecast[:currently][:apparentTemperature]
    @humidity = forecast[:currently][:humidity]
    @uv_index = forecast[:currently][:uvIndex]
  end
end