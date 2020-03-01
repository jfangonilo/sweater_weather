class ForecastFacade
  attr_reader :id, :location

  def initialize(location)
    @location = location
    @id = nil
  end

  def city_state
    geocode.formatted_location
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
    @darksky ||= DarkskyService.new(lat_lng)
  end
end