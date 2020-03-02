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

  def end_location
    directions.end_location
  end

  def travel_time
    directions.travel_time
  end

  def forecast
    darksky.forecast
  end

  def restaurant
    data = yelp.result[:businesses][0]
    Restaurant.new(data)
  end

  private

  def unix_travel_time
    directions.unix_travel_time
  end

  def unix_arrival_time
    (Time.now + unix_travel_time).to_i
  end

  def destination_coords
    directions.destination_coordinates
  end

  def directions
    @directions ||= DirectionsService.new(params)
  end

  def darksky
    @darksky ||= TimetravelService.new(destination_coords, unix_arrival_time)
  end

  def yelp
    @yelp ||= YelpService.new(unix_arrival_time, destination_coords, food)
  end
end