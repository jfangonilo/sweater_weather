class DailyWeather
  attr_reader :time,
              :summary,
              :chance_precip,
              :high_temp,
              :low_temp

  def initialize(daily_data)
    @time = daily_data[:time]
    @summary = daily_data[:summary]
    @chance_precip = daily_data[:precipProbability]
    @high_temp = daily_data[:temperatureHigh]
    @low_temp = daily_data[:temperatureLow]
  end
end