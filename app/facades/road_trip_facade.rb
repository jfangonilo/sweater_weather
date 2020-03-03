class RoadTripFacade
  attr_reader :id,
              :origin,
              :destination

  def initialize(params)
    @id = nil
    @origin = params[:origin]
    @destination = params[:destination]
  end
end