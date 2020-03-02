class MunchiesFacade
  attr_reader :id,
              :start,
              :end,
              :food,
              :params

  def initialize(params)
    @id = nil
    @start = params[:start]
    @end = params[:end]
    @food = params[:food]
    @params = params
  end

  def travel_time
    directions.travel_time
  end

  def forecast
    binding.pry
    darksky.forecast
  end

  def unix_travel_time
    directions.unix_travel_time
  end

  def destination_coords
    directions.destination_coordinates
  end

  def directions
    @directions ||= DirectionsService.new(params)
  end

  def darksky
    @darksky ||= TimetravelService.new(destination_coords, unix_travel_time)
  end
end