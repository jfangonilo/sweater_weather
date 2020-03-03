class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination

  def initialize(params)
    @id = nil
    @origin = params[:origin]
    @destination = params[:destination]
  end

  def travel_time
    directions.travel_time
  end

  def directions
    @directions ||= DirectionsService.new(origin, destination)
  end
end