class Api::V1::RoadTripController < ApplicationController
  def create
    api_key = params[:api_key]
    user = User.find_by(api_key: api_key)
    if !api_key || !user
      render status: 401, json: {data: "Bad Credentials"}
    else
      road_trip = RoadTripFacade.new(road_trip_params)
      render status: 200, json: RoadTripSerializer.new(road_trip)
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end
end