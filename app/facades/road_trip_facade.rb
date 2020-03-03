class RoadTripFacade
  attr_reader :origin,
              :destination

  def initialize(params)
    @origin = params[:origin]
    @destination = params[:destination]
  end
end