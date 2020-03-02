class ForecastFacade
  attr_reader :id, :location

  def initialize(location)
    @location = location
    @id = nil
  end

  def city_state
    geocode.formatted_location
  end

  def forecast
    darksky.result
  end

  def details
    WeatherDetails.new(forecast)
  end

  def current_weather
    CurrentWeather.new(forecast, city_state)
  end

  def hourly_weather
    forecast[:hourly][:data].first(8).map do |hourly_data|
      HourlyWeather.new(hourly_data)
    end
  end

  def daily_weather
    forecast[:daily][:data].first(5).map do |daily_data|
      DailyWeather.new(daily_data)
    end
  end

  def geocode
    @geocode ||= GeocodeService.new(location)
  end

  def darksky
    @darksky ||= DarkskyService.new(geocode.lat_lng)
  end
end