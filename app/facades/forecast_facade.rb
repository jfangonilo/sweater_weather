class ForecastFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def lat_lng
    geocode.lat_lng
  end

  def geocode
    @geocode ||= GeocodeService.new(location)
  end
end