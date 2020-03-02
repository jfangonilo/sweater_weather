class CurrentWeather
  attr_reader :location,
              :summary,
              :temperature,
              :high_temp,
              :low_temp,
              :time

  def initialize(forecast, location)
    @location = location
    @summary = forecast[:currently][:summary]
    @temperature = forecast[:currently][:temperature]
    @high_temp = forecast[:daily][:data][0][:temperatureHigh]
    @low_temp = forecast[:daily][:data][0][:temperatureLow]
    @time = DateTime.now
  end
end