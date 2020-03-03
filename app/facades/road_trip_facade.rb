class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination

  def initialize(params)
    @id = nil
    @origin = params[:origin]
    @destination = params[:destination]
  end

  def origin_address
    directions.origin_address
  end

  def destination_address
    directions.destination_address
  end

  def travel_time
    directions.travel_time
  end

  def arrival_temp
    darksky.future[:currently][:temperature].to_s
  end

  def arrival_summary
    darksky.future[:currently][:summary]
  end

  def unix_travel
    directions.unix_travel_time
  end

  def unix_arrival
    (Time.now + unix_travel).to_i
  end

  def destination_coords
    directions.destination_coordinates
  end

  def directions
    @directions ||= DirectionsService.new(origin, destination)
  end

  def darksky
    @darksky ||= DarkskyService.new(destination_coords, unix_arrival)
  end
end