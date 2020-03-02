class HourlyWeather
  attr_reader :temperature,
              :time

  def initialize(hourly_data)
    @temperature = hourly_data[:temperature]
    @time = Time.at(hourly_data[:time])
  end
end