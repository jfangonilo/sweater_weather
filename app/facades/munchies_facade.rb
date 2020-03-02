class MunchiesFacade
  attr_reader :start,
              :end,
              :food,
              :params

  def initialize(params)
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
    @params = params
  end

  def unix_travel_time
    directions.unix_travel_time
  end

  def destination_coords
    directions.destination_coordinates
  end

  def forecast
    x = darksky.result
    binding.pry
    x
  end

  def directions
    @directions ||= DirectionsService.new(params)
  end

  def darksky
    @darksky ||= TimetravelService.new(destination_coords, unix_travel_time)
  end
end