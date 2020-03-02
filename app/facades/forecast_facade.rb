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
    HourlyWeather.new(forecast)
  end

  def daily_weather
    DailyWeather.new(forecast)
  end

  def geocode
    @geocode ||= GeocodeService.new(location)
  end

  def darksky
    @darksky ||= DarkskyService.new(geocode.lat_lng)
  end
end