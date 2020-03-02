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

  def travel_time
    directions.travel_time
  end

  def directions
    @geocode ||= DirectionsService.new(params)
  end
end