class ForecastFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def lat_lng
    geocode.lat_lng
  end

  def weather
    darksky.weather
  end

  def geocode
    @geocode ||= GeocodeService.new(location)
  end

  def darksky
    @darksky ||= DarkskyService.new(geocode.lat_lng)
  end
end